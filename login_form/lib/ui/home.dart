import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:login_form/ui/login_page.dart';
import 'package:login_form/ui/signup_page.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Icon(Icons.cruelty_free),
            Text("SLOPE",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.3)),
          ],
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0.0,
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            Image.asset('assets/images/programming.png'),
            Padding(padding: EdgeInsets.fromLTRB(0, 20.2, 0, 0)),
            Text(
              "Hello!",
              style: TextStyle(
                  fontSize: 26.4,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 3.4),
            ),
            Center(
                child: Container(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                "Best place to write life stories and share your journey experiences",
                style: TextStyle(fontSize: 18.4, color: Colors.grey),
                textAlign: TextAlign.center,
              ),
            )),
            Center(
                child: SizedBox(
                    height: 50, //height of button
                    width: 250, //width of button
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Color.fromARGB(
                                255, 25, 102, 165), //background color of button

                            shape: RoundedRectangleBorder(
                                //to set border radius to button
                                borderRadius: BorderRadius.circular(5)),
                            padding: EdgeInsets.all(
                                8) //content padding inside button
                            ),
                        onPressed: () {
                          Get.to(() => LoginPage());
                          //code to execute when this button is pressed.
                        },
                        child: Text(
                          "LOGIN",
                          style: TextStyle(letterSpacing: 3.2),
                        )))),
            Center(
                child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                  height: 50, //height of button
                  width: 250, //width of button
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Colors.white, //background color of button
                          onPrimary: Color.fromARGB(255, 25, 102, 165),
                          side: BorderSide(
                              width: 3,
                              color: Color.fromARGB(255, 25, 102, 165)),
                          shape: RoundedRectangleBorder(
                              //to set border radius to button
                              borderRadius: BorderRadius.circular(5)),
                          padding:
                              EdgeInsets.all(8) //content padding inside button
                          ),
                      onPressed: () {
                        Get.to(() => SignupPage());
                        //code to execute when this button is pressed.
                      },
                      child: Text(
                        "SIGNUP",
                        style: TextStyle(letterSpacing: 3.2),
                      ))),
            ))
          ],
        ),
      ),
    );
  }
}
