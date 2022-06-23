import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_getx/controller.dart';

class TestCounter extends StatelessWidget {
  TestCounter({Key? key}) : super(key: key);

  final Controller c = Get.put(Controller());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Obx(() => Text("Clicks: ${c.count}"))),
      body: Center(
          child: ElevatedButton(
        child: Text("Go to Other"),
        onPressed: () => Get.to(Other()),
      )),
      floatingActionButton:
          FloatingActionButton(child: Icon(Icons.add), onPressed: c.increment),
    );
  }
}

class Other extends StatelessWidget {
  Other({Key? key}) : super(key: key);
  final Controller c = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("${c.count}")),
    );
  }
}
