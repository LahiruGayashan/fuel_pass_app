import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import '../services/api_service.dart';

class ScanScreen extends StatelessWidget {
  const ScanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Scan QR")),
      body: MobileScanner(
        onDetect: (BarcodeCapture capture) async {
          final List<Barcode> barcodes = capture.barcodes;

          for (final barcode in barcodes) {
            final String? code = barcode.rawValue;

            if (code != null) {
              var result = await ApiService.scanQR(code);

              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(result)),
              );
              break; // prevent multiple scans
            }
          }
        },
      ),
    );
  }
}