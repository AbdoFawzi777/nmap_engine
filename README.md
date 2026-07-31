# Nmap Engine (`nmap_engine`)

> Network Port Scanner & Service Fingerprinter  
> **Author & Original Architect:** [Abdallah Fawzi Ali Mahmoud](https://github.com/AbdoFawzi777)  
> **Part of the RedOps Hub Monorepo Suite**

---

## 📌 Overview
`nmap_engine` is a production-grade, standalone Flutter package engineered for high-performance mobile security auditing. Built with pure Dart and native Flutter MethodChannels/Isolates, it delivers enterprise-level capability directly on Android & iOS devices without relying on external Linux command-line dependencies.

---

## 🚀 New Capabilities & Features (v2.0)
- **Multi-Threaded TCP Port Scanning:** Blazing fast SYN, ACK, and Connect port scanning on mobile devices.
- **Service Fingerprinting & Banner Grabbing:** Automatic service & version identification for standard ports (21, 22, 80, 443, 3306, 5432, 8080, etc.).
- **CIDR & Subnet Scanning:** Supports scanning individual IPs, hostnames, or entire subnets (`192.168.1.0/24`).
- **Real-Time Event Streaming:** Emits live `PortResult` events for instant UI feedback without blocking main threads.
- **Zero Telemetry & Hardware Keystore Integration:** Secured with AES-256 local encryption and zero phoning home.

---

## 🛠 Usage & Integration

Add `nmap_engine` to your Flutter `pubspec.yaml`:

```yaml
dependencies:
  nmap_engine:
    path: ../packages/nmap_engine
```

### Basic Example

```dart
import 'package:nmap_engine/nmap_engine.dart';

void main() async {
  final engine = NmapEngine();
  
  print('Starting Nmap Engine audit...');
  final results = await engine.execute(
    target: '192.168.1.1',
  );
  
  print('Audit Complete!');
}
```

---

## 🔒 Security & Privacy
- **Zero Telemetry:** No analytics, tracking, or network calls home.
- **Encrypted Local Storage:** Integrates seamlessly with RedOps Hub AES-256 local database.
- **Thread Safety:** All heavy operations execute inside Dart Isolates to maintain 60fps UI rendering.

---

## 👤 Author & Copyright

**Abdallah Fawzi Ali Mahmoud**  
Lead Developer & Security Architect of RedOps Hub  
- **GitHub:** [@AbdoFawzi777](https://github.com/AbdoFawzi777)  
- **Telegram:** [@ABdo_FawZi1](https://telegram.me/ABdo_FawZi1)  
- **Website:** [RedOps Hub Platform](https://redops-hub.web.app)

*Copyright (c) 2026 Abdallah Fawzi Ali Mahmoud. All rights reserved.*
