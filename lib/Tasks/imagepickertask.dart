import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class MyImageSelectClass extends StatefulWidget {
  const MyImageSelectClass({Key? key}) : super(key: key);

  @override
  State<MyImageSelectClass> createState() => _MyImageSelectClassState();
}

class _MyImageSelectClassState extends State<MyImageSelectClass> {

  File? myimage;

  Future<void> changeImage() async {
    var img = await ImagePicker().pickImage(source: ImageSource.gallery);

    setState(() {
      myimage = File(img!.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 100, right: 100),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              myimage == null ? Container(child: Text("No Image"),) : Image(
                image: FileImage(myimage!), height: 200, width: 200,),
              ElevatedButton(onPressed: () {
                changeImage();
              }, child: Text("Change Pic"))
            ],
          ),
        ),
      ),
    );
  }
}
