import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter layout',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter layout demo'),
        ),
        body: Container(
            color: Colors.amberAccent,
            child: Center(child: Text('Hello Eveyone'))),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add_ic_call),
          onPressed: () {
            removeCount();
          },
        ),
      ),
    );
  }

  void removeCount() {
    setState(() {
      counter--;
    });
  }
}
