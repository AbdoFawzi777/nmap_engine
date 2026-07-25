import 'package:flutter_test/flutter_test.dart';
import 'package:nmap_engine/nmap_engine.dart';

void main() {
  test('NmapEngine initial state scan', () async {
    final engine = NmapEngine();
    final result = await engine.scan('127.0.0.1');
    expect(result.target, '127.0.0.1');
    expect(result.openPorts, isEmpty);
  });
}
