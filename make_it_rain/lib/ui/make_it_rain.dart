import 'package:flutter/material.dart';

class MakeItRain extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MakeItRainState();
  }
}

class MakeItRainState extends State<MakeItRain> {
  int _moneyCount = 0;

  makeMoney() {
    setState(() {
      _moneyCount = _moneyCount + 100;
    });
    debugPrint("$_moneyCount");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Make It Rain!"), backgroundColor: Colors.lightGreen),
      body: Container(
        child: Center(
          child: Column(
            children: [
              Text(
                "Get Rich!",
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 32.5,
                    fontWeight: FontWeight.w400),
              ),
              Expanded(
                child: Center(
                  child: Text('\$$_moneyCount',
                      style: TextStyle(
                          color: _moneyCount > 500
                              ? Colors.greenAccent
                              : Colors.blueGrey,
                          fontWeight: FontWeight.w800,
                          fontSize: 30.5)),
                ),
              ),
              Expanded(
                  child: Center(
                child: RaisedButton(
                  color: Colors.lightGreen,
                  onPressed: makeMoney,
                  child: Text(
                    "Let It Rain",
                    style: TextStyle(fontSize: 19.2),
                  ),
                ),
              )),
            ],
          ),
        ),
      ),
    );
  }
}
