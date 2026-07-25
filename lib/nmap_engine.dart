import 'dart:io';
import 'dart:async';

class NmapEngine {
  static final NmapEngine _instance = NmapEngine._internal();
  factory NmapEngine() => _instance;
  NmapEngine._internal();

  bool _initialized = false;

  /// 🚀 تهيئة المحرك
  Future<void> initialize() async {
    _initialized = true;
  }

  /// 🔍 فحص منفذ واحد
  Future<PortResult> scanPort(String host, int port, {int timeout = 2}) async {
    try {
      final socket = await Socket.connect(host, port, timeout: Duration(seconds: timeout));
      socket.destroy();
      return PortResult(port: port, isOpen: true, service: _getServiceName(port));
    } catch (_) {
      return PortResult(port: port, isOpen: false, service: null);
    }
  }

  /// 🔍 فحص منافذ متعددة (متوازي)
  Future<List<PortResult>> scanPorts(String host, List<int> ports, {int timeout = 2}) async {
    final futures = <Future<PortResult>>[];

    for (final port in ports) {
      futures.add(scanPort(host, port, timeout: timeout));
    }

    return await Future.wait(futures);
  }

  /// 🔍 فحص تقليدي (للتوافق)
  Future<NmapResult> scan(String target, {List<int>? ports}) async {
    final scanPortsList = ports ?? [21, 22, 23, 25, 53, 80, 443];
    final results = await scanPorts(target, scanPortsList);
    return NmapResult(
      target: target,
      openPorts: results.where((r) => r.isOpen).map((r) => r.port).toList(),
    );
  }

  /// 🔍 كشف نظام التشغيل (TTL-based)
  Future<OSResult> detectOS(String host) async {
    try {
      // محاولة ping للحصول على TTL
      final process = await Process.run('ping', ['-c', '1', '-W', '1', host]);
      if (process.exitCode == 0) {
        final output = process.stdout as String;
        final match = RegExp(r'ttl=(\d+)').firstMatch(output);
        if (match != null) {
          final ttl = int.parse(match.group(1)!);
          return OSResult(os: _getOSFromTTL(ttl), confidence: 0.85);
        }
      }
      return OSResult(os: 'Unknown', confidence: 0.0);
    } catch (_) {
      return OSResult(os: 'Unknown', confidence: 0.0);
    }
  }

  String _getServiceName(int port) {
    const services = {
      21: 'FTP', 22: 'SSH', 23: 'Telnet', 25: 'SMTP', 53: 'DNS',
      80: 'HTTP', 110: 'POP3', 135: 'MSRPC', 139: 'NetBIOS', 143: 'IMAP',
      443: 'HTTPS', 445: 'SMB', 993: 'IMAPS', 995: 'POP3S', 1723: 'PPTP',
      3306: 'MySQL', 3389: 'RDP', 5432: 'PostgreSQL', 5900: 'VNC',
      6379: 'Redis', 8080: 'HTTP-Alt', 8443: 'HTTPS-Alt',
    };
    return services[port] ?? 'Unknown';
  }

  String _getOSFromTTL(int ttl) {
    if (ttl <= 64) return 'Linux/Unix';
    if (ttl <= 128) return 'Windows';
    if (ttl <= 255) return 'Solaris/AIX';
    return 'Unknown';
  }

  bool get isInitialized => _initialized;
}

class PortResult {
  final int port;
  final bool isOpen;
  final String? service;
  PortResult({required this.port, required this.isOpen, this.service});
}

class OSResult {
  final String os;
  final double confidence;
  OSResult({required this.os, required this.confidence});
}

class NmapResult {
  final String target;
  final List<int> openPorts;
  final Map<String, dynamic> metadata;
  NmapResult({required this.target, required this.openPorts, this.metadata = const {}});
}
