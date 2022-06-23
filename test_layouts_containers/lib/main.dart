import 'package:flutter/material.dart';
//import './ui/home.dart';

import './ui/gesture.dart';

void main() {
  String title = "Gesture";
  runApp(MaterialApp(
    // title: "Containers",
    // title: "Scaffold",
    // home: Home(),
    title: title,
    home: Gesture(
      title: title,
    ),
  ));
}


  /*return Container(
      color: Colors.greenAccent,
      alignment: Alignment.center,
      
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Item 1",
            textDirection: TextDirection.ltr,
            style: TextStyle(
              color: Colors.white,
              fontSize: 12.5,
            ),
          ),
          Text(
            "Item 2",
            textDirection: TextDirection.ltr,
            style: TextStyle(color: Colors.green, fontSize: 12.5),
          ),
          Expanded(
              child: Text(
            "Item 3",
            textDirection: TextDirection.ltr,
          )),
          Text(
            "Item 3",
            textDirection: TextDirection.ltr,
            style: TextStyle(color: Colors.yellow, fontSize: 12.5),
          ),
        ],
      ),
    );
  child: Text(
          "Hello Container",
          textDirection: TextDirection.ltr,
          style: TextStyle(
              color: Colors.white,
              fontSize: 19,
              fontWeight: FontWeight.w500,
              decoration: TextDecoration.none),
          textAlign: TextAlign.center,
        ),

Column
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("First Item",
            textDirection: TextDirection.ltr,
            style: TextStyle(
                color: Colors.white, decoration: TextDecoration.none)),
        Text("Second Item",
            textDirection: TextDirection.ltr,
            style:
                TextStyle(color: Colors.blue, decoration: TextDecoration.none)),
        Container(
          color: Colors.green.shade100,
          alignment: Alignment.bottomLeft,
          child: Text(
            "Third Item",
            style:
                TextStyle(color: Colors.red, decoration: TextDecoration.none),
          ),
        )
      ],
    );*/