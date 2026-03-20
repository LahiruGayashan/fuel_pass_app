import 'package:flutter/material.dart';
import 'package:fuel_pass_app/screen/login_screen.dart';

void main(){
  runApp(FuelPassApp());
}
class FuelPassApp extends StatelessWidget {
  const FuelPassApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: "Fuel Pass",
      theme: ThemeData(primarySwatch: Colors.blue),
      home: LoginScreen(),
    );
  }
}




