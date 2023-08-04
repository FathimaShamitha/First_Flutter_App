import 'package:flutter/material.dart';

import 'LoginPage.dart';

class SignUpClass extends StatefulWidget {
  const SignUpClass({Key? key}) : super(key: key);

  @override
  State<SignUpClass> createState() => _SignUpClassState();
}

class _SignUpClassState extends State<SignUpClass> {
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
              Text(
                "Sign Up",
                style: TextStyle(
                    color: Colors.pink[200],
                    fontWeight: FontWeight.bold,
                    fontSize: 30),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(50, 10, 50, 4),
                child: TextField(
                  decoration: InputDecoration(
                      labelText: "Name",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(50, 4, 50, 4),
                child: TextField(
                  decoration: InputDecoration(
                      labelText: "Email",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(50, 4, 50, 4),
                child: TextField(
                  decoration: InputDecoration(
                      labelText: "Password",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(50, 4, 50, 4),
                child: TextField(
                  decoration: InputDecoration(
                      labelText: "Confirm password",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    // Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginClass()));
                  },
                  child: Text(
                    "Sign Up",
                    style: TextStyle(color: Colors.pink[200], fontSize: 20),
                  )),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account?",
                    style: TextStyle(color: Colors.blue),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginClass()));
                    },
                    child: Text(
                      "Login",
                      style: TextStyle(color: Colors.blue),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
