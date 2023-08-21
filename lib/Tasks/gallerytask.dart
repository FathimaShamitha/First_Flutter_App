import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class MyGallerycalss extends StatefulWidget {
  const MyGallerycalss({Key? key}) : super(key: key);

  @override
  State<MyGallerycalss> createState() => _MyGallerycalssState();
}

class _MyGallerycalssState extends State<MyGallerycalss> {
  File? myImage;
  List<File> gallery = [];

  Future<void> showGallery() async {
    var img = await ImagePicker().pickImage(source: ImageSource.gallery);

    setState(() {
      myImage = File(img!.path);
      gallery.add(myImage!);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GridView.builder(
            itemCount: gallery.length + 1,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              crossAxisSpacing: 1,
              mainAxisSpacing: 1,
            ),
            primary: true,
            itemBuilder: (context, int index) {
              if (index == 0) {
                return InkWell(
                  onTap: showGallery,
                  child: Container(
                    height: 50,
                    width: 50,
                    color: Colors.black12,
                    child: Center(
                        child: Icon(
                      Icons.add,
                      color: Colors.white,
                      size: 40,
                    )),
                  ),
                );
              } else {
                return Container(
                  height: 50,
                  width: 50,
                  child: Image(
                    image: FileImage(gallery[index-1]!),
                    fit: BoxFit.cover,
                  ),
                );
              }
            }),
      ),
    );
  }
}
