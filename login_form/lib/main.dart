import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:get/state_manager.dart';
import 'package:login_form/ui/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Login App",
      theme: ThemeData(
        fontFamily: 'PTSansNarrow',
      ),
      home: Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}
