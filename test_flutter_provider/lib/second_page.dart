import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_flutter_provider/counter_model.dart';
import 'package:test_flutter_provider/main.dart';

class SecondPage extends StatelessWidget {
  SecondPage({Key? key}) : super(key: key);

  //CounterModel _counterModel = CounterModel();

  @override
  Widget build(BuildContext context) {
    var _counterModel = Provider.of<CounterModel>(context, listen: false);
    return Scaffold(
      appBar: AppBar(title: Text("Second Page")),
      body: Container(
        alignment: Alignment.center,
        child: ElevatedButton(
          onPressed: () {
            _counterModel.incrementCounter();
          },
          child: Text("Add"),
        ),
      ),
    );
  }
}
