import 'dart:io';

import 'package:flutter/material.dart';
import 'package:myapplication/provider/view/profileimage.dart';
import 'package:provider/provider.dart';

import '../controller/imageuploadcontroller.dart';

class HomeProviderClass extends StatelessWidget {
  const HomeProviderClass({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final imageObj = Provider.of<ImageUpload>(context);
   /* File? myimage = imageObj.image;*/
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 150,
          ),
          Center(
            child: imageObj.image == null
                ? CircleAvatar(
                    radius: 100,
                    backgroundColor: Colors.lightBlue,
                    child: InkWell(
                        onTap: () {
                          imageObj.uplaodImage();
                        },
                        child: Icon(
                          Icons.add_a_photo,
                          size: 50,
                          color: Colors.white,
                        )),
                  )
                : CircleAvatar(
                    radius: 100,
                    backgroundImage: FileImage(imageObj.image!),
                  ),
          ),
          ElevatedButton(
              style:
                  ElevatedButton.styleFrom(backgroundColor: Colors.lightBlue),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ProfileProviderClass()));
              },
              child: Text(
                "ViewProfile",
                style: TextStyle(color: Colors.white),
              ))
        ],
      ),
    );
  }
}
