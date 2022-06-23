import 'package:first_pj/controller/food_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './view/home_view.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<FoodController>(
        create: (_) => FoodController(),
      )
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}
