import 'package:flutter/material.dart';
import 'package:foody_girl/controller/food_controller.dart';
import 'package:foody_girl/view/home_view.dart';
import 'package:provider/provider.dart';

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
      title: "Foody Girl",
      home: Home(),
    );
  }
}
