import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../util/utils.dart' as util;

class Klimatic extends StatefulWidget {
  const Klimatic({Key? key}) : super(key: key);

  @override
  State<Klimatic> createState() => _KlimaticState();
}

class _KlimaticState extends State<Klimatic> {
  String cityEntered = util.defaultCity;

  void showData() async {
    Map _data = await getWeather(util.apiId, util.defaultCity);
    debugPrint(_data.toString());
  }

  Future goToNextScreen() async {
    Map results = await Navigator.of(context)
        .push(MaterialPageRoute<dynamic>(builder: (context) {
      return ChangeCity();
    }));

    setState(() {
      log('result => ${results}');
      log('result enter value => ${results['enter']}');
      if (results['enter'].isEmpty) {
        cityEntered = util.defaultCity;
      } else if (results.containsKey('enter')) {
        cityEntered = results['enter'];
      }

      log('CITYENTERED => ${cityEntered}');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Klimatic"),
        centerTitle: true,
        backgroundColor: Colors.red,
        actions: [
          IconButton(onPressed: () => goToNextScreen(), icon: Icon(Icons.menu)),
        ],
      ),
      body: Stack(
        children: [
          Center(
            child: Image.asset(
              "images/umbrella.png",
              width: 490.0,
              height: 1200.0,
              fit: BoxFit.fill,
            ),
          ),
          Container(
            alignment: Alignment.topRight,
            margin: EdgeInsets.fromLTRB(0.0, 10.5, 20.5, 0.0),
            child: Text(
              cityEntered,
              style: TextStyle(
                fontSize: 20.5,
                color: Colors.white,
                fontStyle: FontStyle.italic,
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            child: Image.asset('images/light_rain.png'),
          ),
          updateTempWidget(cityEntered),
        ],
      ),
    );
  }

  Future<Map> getWeather(String apiId, String city) async {
    Uri url = Uri.parse(
        "https://api.openweathermap.org/data/2.5/weather?q=$city&appid=${util.apiId}&units=imperial");
    http.Response response = await http.get(url);
    return json.decode(response.body);
  }

  Widget updateTempWidget(String city) {
    return FutureBuilder(
      future: getWeather(util.apiId, city),
      builder: (BuildContext context, AsyncSnapshot<Map> snapshot) {
        //where we get all of the json data, we setup widgets, etc

        if (snapshot.hasData) {
          Map? content = snapshot.data;

          debugPrint(content.toString());

          return Container(
            alignment: Alignment.center,
            margin: EdgeInsets.fromLTRB(20.5, 340.5, 50.8, 0.0),
            child: ListView(children: [
              ListTile(
                  title: Text("${content!['main']['temp']}F",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 49.9,
                          fontWeight: FontWeight.w500)),
                  subtitle: Text(
                    "Humidity: ${content['main']['humidity'].toString()}\n"
                    "Min: ${content['main']['temp_min'].toString()} F\n"
                    "Max: ${content['main']['temp_max'].toString()} F",
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 30.4,
                    ),
                  )),
            ]),
          );
        } else {
          return Container();
        }
      },
    );
  }
}

class ChangeCity extends StatelessWidget {
  var _cityFieldController = TextEditingController();

  ChangeCity({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Change City"),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: Stack(children: [
        Center(
            child: Image.asset(
          'images/white_snow.png',
          width: 490.0,
          height: 1200.0,
          fit: BoxFit.fill,
        )),
        Column(
          children: [
            TextField(
              controller: _cityFieldController,
              decoration: InputDecoration(hintText: "Enter the City"),
              keyboardType: TextInputType.text,
            ),
            TextButton(
                onPressed: () {
                  String city = _cityFieldController.text;

                  String new_city = city;

                  Navigator.pop(context, {
                    'enter': new_city,
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Get Weather",
                    style: TextStyle(
                      color: Colors.redAccent,
                      fontSize: 20.8,
                    ),
                  ),
                )),
          ],
        ),
      ]),
    );
  }
}
