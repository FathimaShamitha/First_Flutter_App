import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyprofileSharedClass extends StatefulWidget {
  const MyprofileSharedClass({Key? key}) : super(key: key);

  @override
  State<MyprofileSharedClass> createState() => _MyprofileSharedClassState();
}

class _MyprofileSharedClassState extends State<MyprofileSharedClass> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  String name = "";
  String email = "";
  String phone = "";
  String qualification = "";
  String gender = "";

  File? img;

  Future<void> changePic() async {
    var pic = await ImagePicker().pickImage(source: ImageSource.gallery);

    setState(() {
      img = File(pic!.path);
    });
  }

  Future<void> getData() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      name = pref.getString("name") ?? "";
      email = pref.getString("email") ?? "";
      phone = pref.getString("phone") ?? "";
      qualification = pref.getString("qualification") ?? "";
      gender = pref.getString("gender") ?? "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 200,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.deepPurple[400]),
            child: Center(
              child: Stack(
                children: [
                  img == null
                      ? CircleAvatar(
                          radius: 80,
                          child: Icon(
                            Icons.person,
                            color: Colors.white,
                            size: 100,
                          ),
                        )
                      : CircleAvatar(
                          radius: 80,
                          backgroundImage: FileImage(img!),
                        ),
                  Positioned(
                    top: 120,
                    left: 110,
                    child: CircleAvatar(
                      radius: 15,
                      backgroundColor: Colors.deepPurple[300],
                      child: InkWell(
                          onTap: changePic,
                          child: Icon(
                            Icons.camera_alt_outlined,
                            color: Colors.white,
                            size: 15,
                          )),
                    ),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30, left: 20),
            child: Text(
              "Username",
              style: TextStyle(color: Colors.grey[500]),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 20),
            child: Text(
              name,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: Colors.deepPurple[300]),
            ),
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 20),
            child: Text(
              "Email",
              style: TextStyle(color: Colors.grey[500]),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 20),
            child: Text(
              email,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: Colors.deepPurple[300]),
            ),
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 20),
            child: Text(
              "Phone",
              style: TextStyle(color: Colors.grey[500]),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 20),
            child: Text(
              phone,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: Colors.deepPurple[300]),
            ),
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 20),
            child: Text(
              "Gender",
              style: TextStyle(color: Colors.grey[500]),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 20),
            child: Text(
              gender,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: Colors.deepPurple[300]),
            ),
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 20),
            child: Text(
              "Qualification",
              style: TextStyle(color: Colors.grey[500]),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 20),
            child: Text(
              qualification,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: Colors.deepPurple[300]),
            ),
          ),
          Divider(),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 50),
              child: ElevatedButton(
                onPressed: () async {
                  Navigator.pop(context);
                  SharedPreferences pref =
                      await SharedPreferences.getInstance();
                  pref.remove("name");
                  pref.remove("email");
                  pref.remove("phone");
                  pref.remove("qualification");
                  pref.remove("gender");
                },
                child: Text(
                  "LogOut",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple[300]),
              ),
            ),
          )
        ],
      ),
    ));
  }
}
