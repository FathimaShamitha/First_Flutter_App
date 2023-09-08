import 'package:flutter/material.dart';
import 'package:myapplication/MyApp/profileviewpagetask.dart';

class MyRegisterClass extends StatefulWidget {
  const MyRegisterClass({Key? key}) : super(key: key);

  @override
  State<MyRegisterClass> createState() => _MyRegisterClassState();
}

class _MyRegisterClassState extends State<MyRegisterClass> {
  String gender = "";
  GlobalKey<FormState> form_key = GlobalKey();
  TextEditingController tc_name = TextEditingController();
  TextEditingController tc_email = TextEditingController();
  TextEditingController tc_phone = TextEditingController();
  TextEditingController tc_qual = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: form_key,
            child: Column(
              children: [
                SizedBox(
                  height: 50,
                ),
                Center(
                    child: Text(
                  "Register",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 40,
                      color: Colors.blue[800]),
                )),
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 40, 30, 10),
                  child: TextFormField(
                    controller: tc_name,
                    decoration: InputDecoration(
                        label: Text(
                          "Name",
                          style: TextStyle(color: Colors.blue[800]),
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Name must be entered";
                      }
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
                  child: TextFormField(
                    controller: tc_email,
                    decoration: InputDecoration(
                        label: Text(
                          "Email",
                          style: TextStyle(color: Colors.blue[800]),
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Email must be entered";
                      }
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
                  child: TextFormField(
                    controller: tc_phone,
                    decoration: InputDecoration(
                        label: Text(
                          "Phone No",
                          style: TextStyle(color: Colors.blue[800]),
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Phone No must be entered";
                      }
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
                  child: Container(
                    height: 65,
                    width: 350,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.black45)),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text(
                            "Gender : ",
                            style: TextStyle(
                                fontSize: 20, color: Colors.blue[800]),
                          ),
                        ),
                        RadioMenuButton(
                            value: "Male",
                            groupValue: gender,
                            onChanged: (value) {
                              setState(() {
                                gender = value!;
                              });
                            },
                            child: Text(
                              "Male",
                              style: TextStyle(color: Colors.blue[800]),
                            )),
                        RadioMenuButton(
                            value: "Female",
                            groupValue: gender,
                            onChanged: (value) {
                              setState(() {
                                gender = value!;
                              });
                            },
                            child: Text(
                              "Female",
                              style: TextStyle(color: Colors.blue[800]),
                            )),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
                  child: TextFormField(
                    controller: tc_qual,
                    decoration: InputDecoration(
                        label: Text(
                          "Qualification",
                          style: TextStyle(color: Colors.blue[800]),
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Qualification  must be entered";
                      }
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
                  child: ElevatedButton(
                    onPressed: () {
                      if (form_key.currentState!.validate()) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MyProfileViewClass(
                                      name: tc_name.text,
                                      email: tc_email.text,
                                      phone: tc_phone.text,
                                      qualification: tc_qual.text,
                                      gender: gender,
                                    )));
                      }
                    },
                    child: Text(
                      "Submit",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue[800]),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
