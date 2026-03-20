import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QRScreen extends StatelessWidget {
  final String qrData = "vehicle_123_token";

  const QRScreen({super.key}); // from API

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("My QR Code")),
      body: Center(
        child: QrImageView(
          data: qrData,
          size: 250,
        ),
      ),
    );
  }
}