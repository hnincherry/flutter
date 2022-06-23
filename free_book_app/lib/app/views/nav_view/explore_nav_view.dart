import 'package:flutter/material.dart';

class ExploreNavView extends StatelessWidget {
  const ExploreNavView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Explore",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.white12,
      ),
      body: Center(child: Text("Explore Nav View")),
    );
  }
}
