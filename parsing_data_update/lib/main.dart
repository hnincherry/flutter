import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() async {
  List _data = await getJson();
  print(_data[0]["title"]);

  for (int i = 0; i < _data.length; i++) {
    print("Title: ${_data[i]["title"]}");

    // print(_data[i]['email']);
    // print(_data[i]['address']['street']);
    // print(_data[i]['address']['geo']['lat']);
  }

  runApp(MaterialApp(
    title: "Parsing JSON data",
    home: Scaffold(
      appBar: AppBar(
        title: Text("Parsing JSON Data"),
        centerTitle: true,
        backgroundColor: Colors.orange,
      ),
      body: ListView.builder(
        itemCount: _data.length,
        itemBuilder: (BuildContext context, int position) {
          return Column(
            children: [
              Divider(height: 13.4),
              ListTile(
                title: Text(
                  _data[position]["title"],
                  style: TextStyle(fontSize: 17.5, fontWeight: FontWeight.bold),
                ),
                subtitle: Text(_data[position]["body"]),
                leading: CircleAvatar(
                  backgroundColor: Colors.orange,
                  child: Text(_data[position]["title"][0]),
                ),
                onTap: () => onTapMessage(context, _data[position]["title"]),
              )
            ],
          );
        },
      ),
    ),
  ));
}

Future<List> getJson() async {
  Uri url = Uri.parse("https://jsonplaceholder.typicode.com/posts");
  //Uri url = Uri.parse("https://jsonplaceholder.typicode.com/users");

  http.Response response = await http.get(url);
  return json.decode(response.body);
}

void onTapMessage(BuildContext context, String message) {
  AlertDialog dialog = AlertDialog(
    title: Text(message),
    actions: [
      TextButton(
        onPressed: () => Navigator.pop(context),
        child: Text("OK"),
      )
    ],
  );

  showDialog(
      context: context,
      builder: (context) {
        return dialog;
      });
}
