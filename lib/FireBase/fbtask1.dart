import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class MyFirebaseSignUpClass extends StatefulWidget {
  @override
  State<MyFirebaseSignUpClass> createState() => MyFirebaseSignUpClassState();
}

class MyFirebaseSignUpClassState extends State<MyFirebaseSignUpClass> {
  TextEditingController tc_name = TextEditingController();
  TextEditingController tc_email = TextEditingController();
  TextEditingController tc_password = TextEditingController();
  TextEditingController tc_phone = TextEditingController();
  GlobalKey<FormState> fkey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: fkey,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 40, top: 60),
                  child: Text(
                    "Sign Up",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                        fontSize: 50),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 30, right: 30, bottom: 10),
                  child: TextFormField(
                    controller: tc_name,
                    decoration: InputDecoration(
                        hintText: "Name",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20))),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 30, right: 30, bottom: 10),
                  child: TextFormField(
                    controller: tc_email,
                    decoration: InputDecoration(
                        labelText: "Email",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20))),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 30, right: 30, bottom: 10),
                  child: TextFormField(
                    controller: tc_phone,
                    decoration: InputDecoration(
                        hintText: "Phone",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20))),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 30, right: 30, bottom: 20),
                  child: TextFormField(
                    controller: tc_password,
                    decoration: InputDecoration(
                        labelText: "Password",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20))),
                  ),
                ),
                ElevatedButton(
                    onPressed: () async {
                      if (fkey.currentState!.validate()) {
                        try {
                          var ref = await FirebaseAuth.instance
                              .createUserWithEmailAndPassword(
                                  email: tc_email.text,
                                  password: tc_password.text);
                          User? user = ref.user;
                          if (user != null) {
                            final db_ref = FirebaseFirestore.instance
                                .collection("Users")
                                .add({
                              "name": tc_name.text,
                              "email": tc_email.text,
                              "phone_no": tc_phone.text,
                              "password": tc_password.text,
                              "id": user.uid
                            });
                          }
                          Fluttertoast.showToast(msg: "Register Success");
                        } on FirebaseAuthException catch (e) {
                          if (e.code == "invalid-email") {
                            Fluttertoast.showToast(msg: "Invaild Email Format");
                          }
                          if (e.code == "weak-password") {
                            Fluttertoast.showToast(
                                msg: "Enter a strong password");
                          }
                          if (e.code == "email-already-in-use") {
                            Fluttertoast.showToast(msg: "Email already exists");
                          }
                        } catch (e) {
                          Fluttertoast.showToast(msg: "An error occured");
                        }
                      }
                    },
                    child: Text(
                      "Register",
                      style: TextStyle(fontSize: 20),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
