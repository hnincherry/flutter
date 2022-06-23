import 'package:flutter/material.dart';
import 'package:login_app/ui/customLoginForm.dart';

void main() => runApp(Login());

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String loginTitle = "Login";
    return MaterialApp(
      title: loginTitle,
      home: Scaffold(
        appBar: AppBar(
          title: Text(loginTitle),
        ),
        backgroundColor: Colors.blueGrey,
        body: CustomLoginForm(),
      ),
    );
  }
}
