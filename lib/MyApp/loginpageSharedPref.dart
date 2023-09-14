import 'package:flutter/material.dart';
import 'package:myapplication/MyApp/profilepageSharedPref.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyloginClass extends StatefulWidget {
  const MyloginClass({Key? key}) : super(key: key);

  @override
  State<MyloginClass> createState() => _MyloginClassState();
}

class _MyloginClassState extends State<MyloginClass> {
  String gender = "";
  String my_name = "";
  String my_email = "";
  String my_phone = "";
  String my_qualification = "";
  String my_gender = "";
  late SharedPreferences pref;

  TextEditingController tc_name = TextEditingController();
  TextEditingController tc_email = TextEditingController();
  TextEditingController tc_phone = TextEditingController();
  TextEditingController tc_qual = TextEditingController();
  GlobalKey<FormState> form_key = GlobalKey();

  Future<void> setData(name, email, phone, qualification, gender) async {
    pref = await SharedPreferences.getInstance();

    setState(() {
      pref.setString("name", name);
      pref.setString("email", email);
      pref.setString("phone", phone);
      pref.setString("qualification", qualification);
      pref.setString("gender", gender);

      my_name = name;
      my_email = email;
      my_phone = phone;
      my_qualification = qualification;
      my_gender = gender;
    });
  }

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
                  "Login",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 40,
                      color: Colors.deepPurple[400]),
                )),
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 40, 30, 10),
                  child: TextFormField(
                    controller: tc_name,
                    decoration: InputDecoration(
                        label: Text(
                          "Name",
                          style: TextStyle(color: Colors.deepPurple[300]),
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
                          style: TextStyle(color: Colors.deepPurple[300]),
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
                          style: TextStyle(color: Colors.deepPurple[300]),
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
                                fontSize: 20, color: Colors.deepPurple[300]),
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
                              style: TextStyle(color: Colors.deepPurple[300]),
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
                              style: TextStyle(color: Colors.deepPurple[300]),
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
                          style: TextStyle(color: Colors.deepPurple[300]),
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
                        setData(tc_name.text, tc_email.text, tc_phone.text,
                            tc_qual.text, gender);
                        tc_name.clear();
                        tc_email.clear();
                        tc_phone.clear();
                        tc_qual.clear();
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MyprofileSharedClass()));
                      }
                    },
                    child: Text(
                      "Login",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepPurple[300]),
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
