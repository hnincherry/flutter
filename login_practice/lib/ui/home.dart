import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class FormData {
  String name = "";
  String password = "";
}

class _HomeState extends State<Home> {
  final _formKey = GlobalKey<FormState>();

  final _formData = new FormData();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(
              Icons.face,
              size: 90,
              color: Colors.white,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: "Name",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(13.0)),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please enter Name";
                  } else {
                    setState(() {
                      _formData.name = value;
                    });
                  }
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                    labelText: "Password",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(13.0))),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please enter Password";
                  } else {
                    setState(() {
                      _formData.password = value;
                    });
                  }
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                RaisedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Scaffold.of(context)
                          .showSnackBar(SnackBar(content: Text("All is good")));
                    }
                  },
                  child: Text("Submit"),
                ),
                RaisedButton(
                  onPressed: () {
                    setState(() {
                      _formData.name = "";
                    });
                    _formKey.currentState!.reset();
                  },
                  child: Text("Clear"),
                ),
              ],
            ),
            Padding(
                padding: const EdgeInsets.all(15.0),
                child: _formData.name.isEmpty
                    ? Text("")
                    : Text(
                        "Welcome ${_formData.name}",
                        style: TextStyle(fontSize: 20.4),
                      )),
          ],
        ),
      ),
    );
  }
}
