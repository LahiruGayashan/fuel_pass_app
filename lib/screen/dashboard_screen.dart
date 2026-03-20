import 'package:flutter/material.dart';
import 'qr_screen.dart';
import 'scan_screen.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Dashboard")),
      body: Column(
        children: [
          ListTile(
            title: Text("My QR Code"),
            onTap: () {
              Navigator.push(context,
                MaterialPageRoute(builder: (_) => QRScreen()));
            },
          ),
          ListTile(
            title: Text("Scan QR (Station)"),
            onTap: () {
              Navigator.push(context,
                MaterialPageRoute(builder: (_) => ScanScreen()));
            },
          ),
        ],
      ),
    );
  }
}