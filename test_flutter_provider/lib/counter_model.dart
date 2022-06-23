import 'dart:developer';

import 'package:flutter/material.dart';

class CounterModel with ChangeNotifier {
  int _counter = 0;
  int get counter => _counter;

  incrementCounter() {
    _counter++;
    notifyListeners();
    log("Counter Model => $_counter");
  }
}

//(1)Initialize provider
//(2)Activate provider
//(3)Call method
//(4)Call Variable

