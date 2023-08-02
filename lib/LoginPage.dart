import 'package:flutter/material.dart';

import 'SignUpPage.dart';

class LoginClass extends StatefulWidget {
  const LoginClass({Key? key}) : super(key: key);

  @override
  State<LoginClass> createState() => _LoginClassState();
}

class _LoginClassState extends State<LoginClass> {

  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Container(
                height: 290,
                width: 500,
                child: Stack(
                  children: [
                    Positioned(
                        left: 150,
                        bottom: 80,
                        child: CircleAvatar(
                          radius: 200,
                          backgroundColor: Colors.pink[200],
                        )),
                    Positioned(
                      bottom: 180,
                      right: 140,
                      child: CircleAvatar(
                        radius: 140,
                        backgroundColor: Colors.pink[100],
                      ),
                    ),
                  ],
                ),
              ),
              Center(
                child: CircleAvatar(
                  radius: 60,
                  backgroundColor: Colors.pink[100],
                  child: Icon(
                    Icons.person,
                    color: Colors.white,
                    size: 100,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(50, 10, 50, 10),
                child: TextField(
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.pink[200],
                      label: Center(
                          child: Text(
                        "Username",
                        style: TextStyle(color: Colors.white, fontSize: 14),
                      )),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(60),
                      )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(50, 10, 50, 10),
                child: TextField(
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.pink[200],
                      label: Center(
                          child: Text(
                        "Password",
                        style: TextStyle(color: Colors.white, fontSize: 14),
                      )),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(60),
                      )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 100),
                child: CheckboxMenuButton(
                    value: isChecked,
                    onChanged: (value) {
                      setState(() {
                        isChecked = value!;
                      });
                    },
                    child: Text(
                      "Remember Me",
                      style: TextStyle(color: Colors.blue, fontSize: 11),
                    )),
              ),
              SizedBox(
                height: 40,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.pink[100] // Background color
                      ),
                  onPressed: () {
                    // Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUpClass()));
                  },
                  child: Text(
                    "Sign in",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  )),
              Text(
                "Forgot Password?",
                style: TextStyle(color: Colors.blue, fontSize: 11),
              )
            ],
          ),
        ),
      ),
    );
  }
}
