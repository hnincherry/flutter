import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

void main() async {
  List _data = await getEarquakeData();

  for (int i = 0; i < _data.length; i++) {
    print(_data.length);
    print("Time: ${_data[i]['properties']['time']}");
  }

  runApp(MaterialApp(
    title: "Quakes",
    home: Scaffold(
      appBar: AppBar(title: Text("Quakes")),
      body: ListView.builder(
        itemCount: _data.length,
        itemBuilder: (BuildContext context, int position) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Divider(
                height: 13.5,
              ),
              ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.green,
                  child: Text(
                    "${_data[position]['properties']['mag'].toStringAsFixed(2)}",
                  ),
                ),
                title: Text(
                  "${dateTimeFormat(_data[position]['properties']['time'])}",
                  style: TextStyle(color: Colors.orange, fontSize: 15.2),
                ),
                subtitle: Text("${_data[position]['properties']['place']}"),
                onTap: () => onTapMessage(
                    context, _data[position]['properties']['title']),
              ),
            ],
          );
        },
      ),
    ),
  ));
}

Future<List> getEarquakeData() async {
  Uri url = Uri.parse(
      "https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/all_day.geojson");

  http.Response response = await http.get(url);

  //print(response.body);
  var data = json.decode(response.body);

  return data["features"];
}

String dateTimeFormat(int timestamp) {
  var dt = DateTime.fromMillisecondsSinceEpoch(timestamp);

  var date = DateFormat('MMMM d, y hh:mm a').format(dt);

  return date;
}

void onTapMessage(BuildContext context, String message) {
  AlertDialog dialog = AlertDialog(
    title: Text("Quakes"),
    content: Text(message),
    actions: [
      TextButton(onPressed: () => Navigator.pop(context), child: Text("OK")),
    ],
  );

  showDialog(
      context: context,
      builder: (context) {
        return dialog;
      });
}
