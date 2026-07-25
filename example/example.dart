import 'package:nmap_engine/nmap_engine.dart';

void main() async {
  final engine = NmapEngine();
  final result = await engine.scan('example.com');
  print('Scan complete for: \${result.target}');
}
