import 'package:flutter/material.dart';

class CustomLoginForm extends StatefulWidget {
  const CustomLoginForm({Key? key}) : super(key: key);

  @override
  State<CustomLoginForm> createState() => _CustomLoginFormState();
}

class _FormData {
  String name = "";
  String password = "";
}

class _CustomLoginFormState extends State<CustomLoginForm> {
  final _data = _FormData();

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Center(
            child: Icon(
              Icons.face,
              size: 90,
              color: Colors.white,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: TextFormField(
                decoration: InputDecoration(
                    labelText: "Name",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(3.3),
                        gapPadding: 2.3)),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please enter name";
                  } else {
                    setState(() {
                      _data.name = value;
                    });

                    debugPrint("${_data.name}");
                  }
                }),
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: TextFormField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: "Password",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(3.3),
                  gapPadding: 2.3,
                ),
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return "Please enter password";
                } else {
                  _data.password = value;
                  debugPrint("${_data.password}");
                }
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  RaisedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // setState(() {
                        //   _data.name = _data.name;
                        // });
                        Scaffold.of(context).showSnackBar(
                            SnackBar(content: Text("All is good!")));
                      }
                    },
                    child: Text("Submit"),
                  ),
                  RaisedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        setState(() {
                          _data.name = "";
                        });
                        _formKey.currentState!.reset();
                      }
                    },
                    child: Text("Clear"),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: _data.name.isEmpty
                ? Text("")
                : Text(
                    "Welcome ${_data.name}",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 19.0,
                      color: Colors.white,
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
