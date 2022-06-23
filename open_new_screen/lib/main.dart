import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: "Open New Screen",
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController _nameController = TextEditingController();

  Future goToNextScreen(BuildContext context) async {
    Map results = await Navigator.of(context).push(MaterialPageRoute<dynamic>(
      builder: (context) {
        return SecondScreen(name: _nameController.text);
      },
    ));

    if (results != null && results.containsKey("info")) {
      debugPrint(results['info'].toString());
      _nameController.text = results['info'].toString();
    } else {
      debugPrint("Nothing");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("First Screen"),
        backgroundColor: Colors.greenAccent,
        centerTitle: true,
      ),
      body: ListView(
        children: [
          TextField(
            controller: _nameController,
            decoration: InputDecoration(labelText: "Enter Your Name"),
          ),
          ElevatedButton(
            child: Text("Send To Next Screen"),
            onPressed: () {
              goToNextScreen(context);
              // var router = MaterialPageRoute(builder: (BuildContext context) {
              //   return SecondScreen(
              //     name: _nameController.text,
              //   );
              // });
              // Navigator.of(context).push(router);
            },
          )
        ],
      ),
    );
  }
}

class SecondScreen extends StatefulWidget {
  final String name;
  const SecondScreen({Key? key, required this.name}) : super(key: key);

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  var _backNameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Screen"),
        backgroundColor: Colors.greenAccent,
        centerTitle: true,
      ),

      body: Container(
        child: Column(children: [
          Text("${widget.name}",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 19.8,
              )),
          TextField(
            controller: _backNameController,
            decoration: InputDecoration(labelText: "Enter your address"),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, {
              "info": _backNameController.text,
            }),
            child: Text("Send Data Back"),
          )
        ]),
      ),
      // body: Text(
      //   widget.name,
      //   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19.8),
      // ),
    );
  }
}
