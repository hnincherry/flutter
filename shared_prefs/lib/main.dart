import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MaterialApp(
    title: "SharedPreferences",
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var _textEnterController = TextEditingController();
  String _savedData = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _loadSavedData();
  }

  _loadSavedData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      _savedData = preferences.getString("data")!;
    });
  }

  _saveMessage(String message) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString("data", message);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Shared Prefs"),
        centerTitle: true,
      ),
      body: Column(children: [
        TextField(
            controller: _textEnterController,
            decoration: InputDecoration(labelText: "Write Something")),
        TextButton(
            onPressed: () {
              _saveMessage(_textEnterController.text);
            },
            child: Column(
              children: [
                Text("Save Data\n"),
                Padding(padding: EdgeInsets.all(15.4)),
                Text(_savedData),
              ],
            )),
      ]),
    );
  }
}
