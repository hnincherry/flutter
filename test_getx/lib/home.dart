import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_getx/controller.dart';

import 'package:test_getx/second_page.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var controller = Get.put(Controller());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Get Testing")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: const Text('Show snackbar'),
              onPressed: (() {
                Get.snackbar("Hi", "I am Hnin Cherry",
                    snackPosition: SnackPosition.BOTTOM);
              }),
            ),
            ElevatedButton(
              child: const Text('Show dialog'),
              onPressed: (() {
                Get.defaultDialog(
                  title: "Dialog",
                  content: Text("Do you want to see counter?"),
                  onConfirm: () {
                    Get.toNamed('/test_counter');
                  },
                  onCancel: () {},
                  textConfirm: "OK",
                  textCancel: "Reject",
                );
              }),
            ),
            ElevatedButton(
              child: const Text('Show Bottom Sheet'),
              onPressed: (() {
                openBottomSheet();
              }),
            ),
            ElevatedButton(
              child: const Text('SecondScreen'),
              onPressed: (() {
                // Get.to(SecondPage(),
                //     transition: Transition.cupertino,
                //     arguments: 'I am Argument');
                // fullscreenDialog: true
                // Get.off(SecondPage());

                Get.toNamed('/second_page', arguments: 'I am Argument');
              }),
            ),
            Text('hello'.tr),
            Row(
              children: [
                ElevatedButton(
                  child: const Text('Myanmar'),
                  onPressed: (() {
                    var locale = Locale('my', 'MM');
                    Get.updateLocale(locale);
                  }),
                ),
                ElevatedButton(
                  child: const Text('English'),
                  onPressed: (() {
                    var locale = Locale('en', 'US');
                    Get.updateLocale(locale);
                  }),
                ),
              ],
            ),
            Obx(() => SwitchListTile(
                  value: controller.isDarkMode.value,
                  onChanged: (newValue) {
                    controller.updateTheme(newValue);
                  },
                  title: const Text('Dark Mode'),
                )),
          ],
        ),
      ),
    );
  }

  void openBottomSheet() {
    Get.bottomSheet(
      Column(
        children: [
          const SizedBox(height: 20),
          const Center(
            child: Text(
              'Bottom Sheet',
              style: TextStyle(fontSize: 18),
            ),
          ),
          OutlinedButton(
            onPressed: () {
              Get.back();
            },
            child: const Text('Close'),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
