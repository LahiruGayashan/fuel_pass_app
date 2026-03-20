import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const baseUrl = "http://YOUR_SERVER_IP:8080/api";

  static Future<String> scanQR(String qrToken) async {
    final response = await http.post(
      Uri.parse("$baseUrl/fuel/scan"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "qrToken": qrToken,
        "liters": 5
      }),
    );

    if (response.statusCode == 200) {
      return "Fuel Issued ✅";
    } else {
      return "Failed ❌";
    }
  }
}