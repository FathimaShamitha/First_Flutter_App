import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class MyProfileViewClass extends StatefulWidget {
  final name;
  final email;
  final phone;
  final qualification;
  final gender;

  const MyProfileViewClass(
      {Key? key,
      this.name,
      this.email,
      this.phone,
      this.qualification,
      this.gender})
      : super(key: key);

  @override
  State<MyProfileViewClass> createState() => _MyProfileViewClassState(
        this.name,
        this.email,
        this.phone,
        this.qualification,
        this.gender,
      );
}

class _MyProfileViewClassState extends State<MyProfileViewClass> {
  var name;
  var email;
  var qualification;
  var gender;
  var phone;

  _MyProfileViewClassState(
    this.name,
    this.email,
    this.phone,
    this.qualification,
    this.gender,
  );

  File? img;

  Future<void> changePic() async {
    var pic = await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      img = File(pic!.path);
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
              child: Center(
                child: Stack(
                  children: [
                    img == null
                        ? CircleAvatar(
                            radius: 80,
                            backgroundColor: Colors.blue[900],
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
                        backgroundColor: Colors.blue[700],
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
                this.name,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Colors.blue[800]),
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
                this.email,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Colors.blue[800]),
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
                this.phone,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Colors.blue[800]),
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
                this.gender,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Colors.blue[800]),
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
                this.qualification,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Colors.blue[800]),
              ),
            ),
            Divider(),
          ],
        ),
      ),
    );
  }
}
