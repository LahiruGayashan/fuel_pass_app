import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dashboard_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final TextEditingController phoneController = TextEditingController();
  final TextEditingController otpController = TextEditingController();

  String verificationId = "";
  bool otpSent = false;

  //  Send OTP
  void sendOTP() async {
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: phoneController.text,
      verificationCompleted: (PhoneAuthCredential credential) async {
        await FirebaseAuth.instance.signInWithCredential(credential);
        goToDashboard();
      },
      verificationFailed: (FirebaseAuthException e) {
        print("Error: ${e.message}");
      },
      codeSent: (String verId, int? resendToken) {
        setState(() {
          verificationId = verId;
          otpSent = true;
        });
      },
      codeAutoRetrievalTimeout: (String verId) {},
    );
  }

  // 🔢 Verify OTP
  void verifyOTP() async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
      verificationId: verificationId,
      smsCode: otpController.text,
    );

    await FirebaseAuth.instance.signInWithCredential(credential);
    goToDashboard();
  }

  void goToDashboard() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => DashboardScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Phone Login")),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [

            //  Phone Input
            TextField(
              controller: phoneController,
              decoration: InputDecoration(labelText: "Phone (+947XXXXXXXX)"),
            ),

            SizedBox(height: 20),

            //  Send OTP
            if (!otpSent)
              ElevatedButton(
                onPressed: sendOTP,
                child: Text("Send OTP"),
              ),

            //  OTP Input
            if (otpSent) ...[
              TextField(
                controller: otpController,
                decoration: InputDecoration(labelText: "Enter OTP"),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: verifyOTP,
                child: Text("Verify OTP"),
              ),
            ]
          ],
        ),
      ),
    );
  }
}