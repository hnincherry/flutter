import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var data = await readData();

  if (data != null) {
    String message = await readData();
    debugPrint("Read Data => ${message}");
  }
  runApp(MaterialApp(
    title: "Read&Write File",
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String readStr = '';

  void readString(String str) async {
    await writeData(str);
    String result = await readData();

    setState(() {
      readStr = result;
    });
  }

  void lastData() async {
    String result = await readData();
    setState(() {
      readStr = result;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    lastData();
  }

  var _enterDataController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Read/Write"),
        centerTitle: true,
        backgroundColor: Colors.greenAccent,
      ),
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.all(13.5),
          child: TextField(
            controller: _enterDataController,
            decoration: InputDecoration(labelText: "Write Something!!"),
          ),
        ),
        TextButton(
            onPressed: () {
              //writeData(_enterDataController.text);
              readString(_enterDataController.text);
              print("TextBox Data => ${_enterDataController.text}");
            },
            child: Column(
              children: [
                Text("Save Data"),
                Padding(
                  padding: EdgeInsets.all(14.6),
                ),
                Text(readStr),
                // ElevatedButton(
                //     onPressed: () async {
                //       var data = await readData();
                //       print("Read Data => ${data}");
                //     },
                //     child: Text("Read Data")),
              ],
            ))
      ]),
    );
  }
}

Future<String> get _localPath async {
  final directory = await getApplicationDocumentsDirectory();
  return directory.path;
}

Future<File> get _localFile async {
  final path = await _localPath;
  return File('$path/data.txt');
}

Future<File> writeData(String message) async {
  final file = await _localFile;
  return file.writeAsString('$message');
}

Future<String> readData() async {
  try {
    final file = await _localFile;
    String data = await file.readAsString();
    return data;
  } catch (e) {
    return 'Nothing Saved Yet! $e';
  }
}
