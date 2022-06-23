import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

class Controller extends GetxController {
  var count = 0.obs;
  var isDarkMode = false.obs;

  increment() => count++;

  updateTheme(bool value) {
    Get.changeTheme(value ? ThemeData.dark() : ThemeData.light());
    isDarkMode.value = value;
  }
}
