import 'package:flutter/material.dart';

class BMI extends StatefulWidget {
  const BMI({Key? key}) : super(key: key);

  @override
  State<BMI> createState() => _BMIState();
}

class _BMIState extends State<BMI> {
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();

  double _finalResult = 0.0;
  String _formattedString = "";

  void calculateWeight() {
    String height = _heightController.text;
    String weight = _weightController.text;

    debugPrint("Height: ${height}");
    debugPrint("Weight: ${weight}");

    setState(() {
      _finalResult = int.parse(weight) / int.parse(height);

      if (_finalResult < 18.5) {
        _formattedString = "UnderWeight";
      } else if (_finalResult >= 18.5 && _finalResult <= 24.9) {
        _formattedString = "Normal Weight";
      } else if (_finalResult > 25 && _finalResult <= 29.9) {
        _formattedString = "OverWeight";
      } else {
        _formattedString = "Obese";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("BMI"),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
      ),
      body: Column(
        children: [
          Container(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("B",
                      style: TextStyle(
                        fontSize: 45.2,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        backgroundColor: Colors.purple,
                        fontFamily: "Serif",
                      )),
                  Text("MI",
                      style: TextStyle(
                        fontSize: 45.2,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Serif",
                      )),
                ],
              ),
            ),
          ),
          Container(
            color: Color.fromARGB(255, 214, 213, 213),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: null,
                  decoration: InputDecoration(
                      labelText: "Age", icon: Icon(Icons.person_outline)),
                ),
                TextField(
                  controller: _heightController,
                  decoration: InputDecoration(
                      labelText: "Height In Feet",
                      icon: Icon(Icons.bar_chart_outlined)),
                ),
                TextField(
                  controller: _weightController,
                  decoration: InputDecoration(
                      labelText: "Weight In Pound",
                      icon: Icon(Icons.format_align_justify_outlined)),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ElevatedButton(
                    onPressed: calculateWeight,
                    child: Text("Calculate"),
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.redAccent)),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              "Your BMI: ${_finalResult.toStringAsFixed(2)}",
              style: TextStyle(color: Colors.blue, fontSize: 20.5),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              "${_formattedString}",
              style: TextStyle(color: Colors.red, fontSize: 20.5),
            ),
          ),
        ],
      ),
    );
  }
}
