import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';

import 'fbtask7View.dart';


class MyFbStorageClass extends StatefulWidget {
  const MyFbStorageClass({Key? key}) : super(key: key);

  @override
  State<MyFbStorageClass> createState() => _MyFbStorageClassState();
}

class _MyFbStorageClassState extends State<MyFbStorageClass> {

  File? myImage;
  UploadTask? task;

  Future<void> getImage() async {
    var img = await ImagePicker().pickImage(source: ImageSource.gallery);

    setState(() {
      myImage = File(img!.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height/3,
              width: MediaQuery.of(context).size.width,
              child: myImage==null?Center(child: Text("Nothing to dispaly!!!",style: TextStyle(fontSize: 20),)):
              Image(image: FileImage(myImage!),),
            ),
            ElevatedButton(onPressed: (){
              getImage();
            }, child: Text("Add")),
            ElevatedButton(onPressed: ()async{
              final ref = await FirebaseStorage.instance.ref().child("MyImages/${myImage!.path}");
              task = ref.putFile(myImage!);
              final snap = await task!.whenComplete((){});
              var imageUrl = await snap.ref.getDownloadURL();
              final db_ref = FirebaseFirestore.instance.collection("MyImages").add({"imageurl":imageUrl});
              Fluttertoast.showToast(msg: "Image Uploaded",);
              }, child: Text("Submit")),
            ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>MyFbStorageViewClass()));
            }, child: Text("View Gallery"))
          ],
        ),
      ),
    );
  }
}