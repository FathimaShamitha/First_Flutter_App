import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class MyFirebaseRegisterClass extends StatefulWidget {
  const MyFirebaseRegisterClass({Key? key}) : super(key: key);

  @override
  State<MyFirebaseRegisterClass> createState() =>
      _MyFirebaseRegisterClassState();
}

class _MyFirebaseRegisterClassState extends State<MyFirebaseRegisterClass> {
  TextEditingController tc_name = TextEditingController();
  TextEditingController tc_email = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30, bottom: 20),
              child: TextFormField(
                controller: tc_name,
                decoration: InputDecoration(
                    hintText: "Name",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30, bottom: 40),
              child: TextFormField(
                controller: tc_email,
                decoration: InputDecoration(
                    hintText: "Email",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30))),
              ),
            ),
            ElevatedButton(
                onPressed: () async {
                  final ref = await FirebaseFirestore.instance
                      .collection("Users")
                      .add({"name": tc_name.text, "email": tc_email.text});
                  Fluttertoast.showToast(msg: "Submitted");
                },
                child: Text("Submit"))
          ],
        ),
      ),
    );
  }
}
