import 'package:flutter/material.dart';

void main() {
  runApp(
    const Center(
      child: Text(
        'Hello Flutter!',
        textDirection: TextDirection.rtl,
        style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.indigo,
            fontSize: 50,
            fontStyle: FontStyle.italic),
      ),
    ),
  );
}
