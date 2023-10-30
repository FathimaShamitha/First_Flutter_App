import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class MyFirebaseSignInClass extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MyFirebaseSignInClassState();
}

class MyFirebaseSignInClassState extends State<MyFirebaseSignInClass> {
  @override
  Widget build(BuildContext context) {
    TextEditingController emailcntrl = TextEditingController();
    TextEditingController passwrdcntrl = TextEditingController();

    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 40, right: 40, bottom: 20),
              child: TextFormField(
                controller: emailcntrl,
                decoration: InputDecoration(
                    hintText: "Email",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 40, right: 40, bottom: 40),
              child: TextFormField(
                controller: passwrdcntrl,
                decoration: InputDecoration(
                    hintText: "Password",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
            ),
            ElevatedButton(
                onPressed: () async {
                  try {
                    var ref = await FirebaseAuth.instance
                        .signInWithEmailAndPassword(
                            email: emailcntrl.text,
                            password: passwrdcntrl.text);
                    Fluttertoast.showToast(msg: "Login Success");
                    User? user = ref.user;
                    print("==========$user");
                  } on FirebaseAuthException catch (e) {
                    print('=========Failed with error code: ${e.code}');
                    print(e.message);
                    Fluttertoast.showToast(msg: "INVALID_LOGIN_CREDENTIALS");
                  }
                },
                child: Text("Sign Up"))
          ],
        ),
      ),
    );
  }
}
