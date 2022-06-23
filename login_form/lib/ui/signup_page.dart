import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  TextEditingController name_controller = TextEditingController();
  TextEditingController email_controller = TextEditingController();
  TextEditingController pass_controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
        ),
        body: ListView(children: [
          Container(
            padding: EdgeInsets.fromLTRB(18.5, 15.5, 0, 0),
            color: Colors.white,
            child: Column(children: [
              Text(
                "Hi!",
                style: TextStyle(
                    fontSize: 30.5,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 3.4,
                    color: Color.fromARGB(255, 25, 102, 165)),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Create a new account",
                  style: TextStyle(
                      fontSize: 18.4, color: Color.fromARGB(100, 25, 102, 165)),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                  padding: const EdgeInsets.fromLTRB(0, 20.5, 0, 0),
                  child: Container(
                    child: Column(
                      children: [
                        TextField(
                          controller: name_controller,
                          decoration: InputDecoration(
                              labelText: "Enter Name",
                              labelStyle: TextStyle(
                                  color: Color.fromARGB(255, 25, 102, 165))),
                        ),
                        TextField(
                          controller: email_controller,
                          decoration: InputDecoration(
                              labelText: "Enter Email",
                              labelStyle: TextStyle(
                                  color: Color.fromARGB(255, 25, 102, 165))),
                        ),
                        TextField(
                          controller: pass_controller,
                          decoration: InputDecoration(
                            labelText: "Enter Password",
                            labelStyle: TextStyle(
                                color: Color.fromARGB(255, 25, 102, 165)),
                          ),
                          obscureText: true,
                        ),
                      ],
                    ),
                  )),
              Center(
                  child: Padding(
                padding: const EdgeInsets.all(20.6),
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
                          //code to execute when this button is pressed.
                        },
                        child: Text(
                          "LOGIN",
                          style: TextStyle(letterSpacing: 3.2),
                        ))),
              )),
              Text(
                "Forget Password?",
                style: TextStyle(
                    fontSize: 15.4, color: Color.fromARGB(100, 25, 102, 165)),
                textAlign: TextAlign.center,
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(children: <Widget>[
                  Expanded(
                      child: Divider(
                    color: Colors.black,
                  )),
                  Text("OR"),
                  Expanded(
                      child: Divider(
                    color: Colors.black,
                  )),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  "Social Media Signup",
                  style: TextStyle(
                      fontSize: 18.4, color: Color.fromARGB(100, 25, 102, 165)),
                  textAlign: TextAlign.center,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.face,
                    size: 45.8,
                  ),
                  Icon(
                    Icons.facebook,
                    size: 45.8,
                  ),
                  Icon(
                    Icons.apple,
                    size: 45.8,
                  )
                ],
              ),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Text(
                  "Already have an account?",
                  style: TextStyle(
                      fontSize: 15.4, color: Color.fromARGB(100, 25, 102, 165)),
                ),
                TextButton(
                    onPressed: () {},
                    child: Text(
                      "Sign in",
                      style:
                          TextStyle(color: Color.fromARGB(255, 25, 102, 165)),
                    ))
              ]),
            ]),
          ),
        ]));
  }
}
