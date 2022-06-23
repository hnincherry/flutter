import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Container
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        title: Text("Fency Day"),
        backgroundColor: Colors.amberAccent,
        actions: [
          IconButton(
              onPressed: () => debugPrint("Icon Tapped"),
              icon: Icon(Icons.send)),
          IconButton(onPressed: _onPress, icon: Icon(Icons.search))
        ],
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Hnin Cherry",
              style: TextStyle(
                fontSize: 22.5,
                fontWeight: FontWeight.w500,
                color: Colors.red[800],
              ),
            ),
            InkWell(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Text Button",
                ),
              ),
              onTap: () => debugPrint("Text Button Tapped"),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => debugPrint("Pressed!!!"),
        tooltip: "Great",
        backgroundColor: Colors.greenAccent,
        child: Icon(Icons.add_call),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.add), label: "Hey"),
          BottomNavigationBarItem(icon: Icon(Icons.print), label: "Print"),
          BottomNavigationBarItem(
              icon: Icon(Icons.call_missed), label: "Missed"),
        ],
        onTap: (int i) => debugPrint("Hey Touched $i"),
      ),
    );
  }

  void _onPress() {
    print("Search Tapped");
  }
}
