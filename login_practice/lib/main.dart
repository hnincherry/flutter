import 'package:flutter/material.dart';
import './ui/home.dart';

void main() {
  runApp(Login());
}

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Login App Practice",
      home: Scaffold(
        appBar: AppBar(
          title: Text("Login App"),
        ),
        backgroundColor: Colors.blueGrey,
        body: Home(),
      ),
    );
  }
}
