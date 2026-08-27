<div align="center">

# 🗺️ Nmap Engine for Dart & Flutter

**v2.0.0 — Sovereign On-Device Security Engine for Dart & Flutter**

[![Dart](https://img.shields.io/badge/Dart-3.x-0175C2?logo=dart)](https://dart.dev)
[![Flutter](https://img.shields.io/badge/Flutter-3.x-02569B?logo=flutter)](https://flutter.dev)
[![License](https://img.shields.io/badge/License-MIT-red.svg)](LICENSE)
[![Version](https://img.shields.io/badge/Version-2.0.0-E05555)](https://github.com/AbdoFawzi777/nmap_engine/releases)
[![RedOps Hub](https://img.shields.io/badge/Integrated_in-RedOps_Hub_v2.0-6C3AED)](https://github.com/AbdoFawzi777/redops-hub)

*Part of the RedOps Hub Sovereign Mobile Security Suite.*

</div>

---

## 📖 Overview

`nmap_engine` is a production-grade, 100% on-device Dart/Flutter package designed for mobile security auditing, defensive telemetry extraction, and penetration testing automation.

> **🔒 Sovereignty Mandate:** All operations execute locally in memory and over direct socket/HTTP requests. Zero third-party telemetry, tracking, or cloud dependencies.

---

## ✨ Key Capabilities

- ⚡ **Parallel TCP Connect Probing**: Ultra-fast non-blocking asynchronous socket scanning.
- 📚 **100+ Port Service Database**: Preloaded with enterprise and standard IANA port definitions.
- 🕵️ **Live Banner Grabbing**: Probes HTTP, HTTPS, SSH, FTP, and custom sockets to capture real service banners and versions.
- 🖥️ **TTL-Based OS Fingerprinting**: Heuristic OS classification based on ICMP/TCP TTL thresholds.
- 🛡️ **Stealth Identity Shield**: Integrated custom User-Agent and proxy routing adapter.

---

## 📦 Installation

Add `nmap_engine` to your `pubspec.yaml`:

```yaml
dependencies:
  nmap_engine:
    git:
      url: https://github.com/AbdoFawzi777/nmap_engine.git
      ref: main
```

Or for local monorepo development:

```yaml
dependencies:
  nmap_engine:
    path: packages/nmap_engine
```

---

## 🚀 Quick Start & Usage

```dart
import 'package:nmap_engine/nmap_engine.dart';

void main() async {
  final engine = NmapEngine();
  await engine.initialize();

  // Scan default top ports on target
  final result = await engine.fullScan('scanme.nmap.org', timeout: 2);
  
  print('Target: ${result.target} (${result.resolvedIp})');
  print('Open Ports: ${result.openPortCount}');
  for (final port in result.openPorts) {
    print('  - Port ${port.port}/${port.protocol}: ${port.service} (Banner: ${port.banner})');
  }
  print('Estimated OS: ${result.osDetection.os} (Confidence: ${result.osDetection.confidence})');
}
```

---

## 🛡️ Anti-Fake Telemetry Integration

`nmap_engine` is built to interface directly with the **RedOps Hub Anti-Fake Verification Pipeline**. All returned data structures contain genuine socket/HTTP evidence objects, raw status headers, and timestamps, preventing synthetic or hallucinated results in downstream AI aggregators.

---

## 📄 License & Legal Notice

> **⚠️ Legal Notice:** This tool is designed exclusively for authorized penetration testing, security auditing, and educational research. Always obtain explicit written authorization before scanning target infrastructure.

Distributed under the **MIT License**. Copyright (c) 2026 **Eng. Abdallah Fawzi Ali Mahmoud**.

---

<div align="center">

Maintained by **[Abdallah Fawzi Ali Mahmoud](https://github.com/AbdoFawzi777)**  
[Official Platform](https://redops-hub.web.app/) · [RedOps Hub Monorepo](https://github.com/AbdoFawzi777/redops-hub)

</div>
