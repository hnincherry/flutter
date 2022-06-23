import 'package:flutter/material.dart';

class Gesture extends StatelessWidget {
  final String title;

  Gesture({Key? key, required this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(
        child: CustomButton(),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      //Actual Button
      child: Container(
        padding: EdgeInsets.all(18.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.5),
          color: Colors.yellow,
        ),
        child: Text("First Button"),
      ),

      onTap: () {
        final snackbar = SnackBar(
          content: Text("Hello Gesture"),
          backgroundColor: Colors.greenAccent,
        );

        Scaffold.of(context).showSnackBar(snackbar);
      },
    );
  }
}
