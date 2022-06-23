import 'package:flutter/material.dart';
import './ui/bmi.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "BMI",
      home: BMI(),
    );
  }
}
