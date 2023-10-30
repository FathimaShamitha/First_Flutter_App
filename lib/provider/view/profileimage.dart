import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controller/imageuploadcontroller.dart';

class ProfileProviderClass extends StatelessWidget {
  const ProfileProviderClass({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final imageObj = Provider.of<ImageUpload>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
      ),
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 3,
            width: MediaQuery.of(context).size.width,
            child: Center(
              child: Stack(
                children: [
                  imageObj.image == null
                      ? CircleAvatar(
                          radius: 100,
                          child: Icon(
                            Icons.person,
                            color: Colors.white,
                            size: 150,
                          ),
                        )
                      : CircleAvatar(
                          radius: 100,
                          backgroundImage: FileImage(imageObj.image!),
                        ),
                  Positioned(
                      left: 140,
                      top: 150,
                      child: InkWell(
                        onTap: () {
                          imageObj.uplaodImage();
                        },
                        child: CircleAvatar(
                            radius: 20,
                            backgroundColor: Colors.lightBlue,
                            child: Icon(
                              Icons.photo_camera_rounded,
                              color: Colors.white,
                            )),
                      ))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
