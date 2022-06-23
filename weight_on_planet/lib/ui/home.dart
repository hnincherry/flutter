import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController _weightController = TextEditingController();
  double _finalResult = 0.0;
  String _formattedText = "";

  int radioGroupValue = 0;

  void handleValueChanged(int? value) {
    setState(() {
      radioGroupValue = value!;

      debugPrint("$radioGroupValue");
      switch (radioGroupValue) {
        case 0:
          _finalResult = calculateWeight(_weightController.text, 0.06);
          _formattedText = "Your Weight on Pluto is ${_finalResult}";
          break;
        case 1:
          _finalResult = calculateWeight(_weightController.text, 0.38);
          _formattedText = "Your Weight on Mars is ${_finalResult}";
          break;
        case 2:
          _finalResult = calculateWeight(_weightController.text, 0.91);
          _formattedText = "Your Weight on Venus is ${_finalResult}";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Weight On Planet X"),
        centerTitle: true,
        backgroundColor: Colors.black38,
      ),
      backgroundColor: Colors.blueGrey,
      body: Container(
        alignment: Alignment.topCenter,
        child: ListView(
          padding: EdgeInsets.all(2.5),
          children: [
            Image.asset(
              'images/planet.png',
              height: 100.0,
              width: 200.0,
            ),
            Container(
              alignment: Alignment.center,
              child: Column(children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextField(
                    controller: _weightController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        labelText: "Your Weight On Earth",
                        icon: Icon(Icons.person_outline),
                        hintText: "In Pounds",
                        errorText: _weightController.text.isEmpty
                            ? "Enter Weight"
                            : null),
                  ),
                ),
                Padding(padding: EdgeInsets.all(5.6)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Radio<int>(
                        activeColor: Colors.brown,
                        value: 0,
                        groupValue: radioGroupValue,
                        onChanged: handleValueChanged),
                    Text(
                      "Pluto",
                      style: TextStyle(color: Colors.white30),
                    ),
                    Radio<int>(
                        activeColor: Colors.red,
                        value: 1,
                        groupValue: radioGroupValue,
                        onChanged: handleValueChanged),
                    Text(
                      "Mars",
                      style: TextStyle(color: Colors.white30),
                    ),
                    Radio<int>(
                        activeColor: Colors.orangeAccent,
                        value: 2,
                        groupValue: radioGroupValue,
                        onChanged: handleValueChanged),
                    Text(
                      "Venus",
                      style: TextStyle(color: Colors.white30),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(20.5),
                  child: Text(
                    _weightController.text.isEmpty
                        ? "Please Enter Weight"
                        : "${_formattedText}",
                    style: TextStyle(
                        fontSize: 20.3,
                        color: Colors.white,
                        fontWeight: FontWeight.w500),
                  ),
                )
              ]),
            ),
          ],
        ),
      ),
    );
  }

  calculateWeight(String weight, double multiplier) {
    if (int.parse(weight).toString().isNotEmpty && int.parse(weight) > 0) {
      return int.parse(weight) * multiplier;
    } else {
      return "Wrong";
    }
  }
}
