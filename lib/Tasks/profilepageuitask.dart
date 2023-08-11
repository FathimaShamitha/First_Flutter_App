import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class MyProfileClass extends StatefulWidget {
  const MyProfileClass({Key? key}) : super(key: key);

  @override
  State<MyProfileClass> createState() => _MyProfileClassState();
}

class _MyProfileClassState extends State<MyProfileClass> {
  File? pimage, cimage;

  Future<void> changeProfilePic() async {
    var img = await ImagePicker().pickImage(source: ImageSource.gallery);

    setState(() {
      pimage = File(img!.path);
    });
  }

  Future<void> changeCoverPic() async {
    var img2 = await ImagePicker().pickImage(source: ImageSource.gallery);

    setState(() {
      cimage = File(img2!.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Container(
                height: 250,
                width: MediaQuery.of(context).size.width,
                child: Stack(children: [
                  pimage == null
                      ? Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          child: Container(
                            height: 170,
                            width: 400,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.grey[300]),
                          ),
                        )
                      : Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          child: Container(
                            height: 170,
                            width: 400,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: SizedBox(
                              width: 400,
                              child: Image(
                                image: FileImage(cimage!),
                                fit: BoxFit.fitWidth,
                              ),
                            ),
                          ),
                        ),
                  pimage == null
                      ? Positioned(
                          left: 80,
                          bottom: 10,
                          child: CircleAvatar(
                            radius: 100,
                            backgroundColor: Colors.grey[100],
                            child: Icon(
                              Icons.person,
                              color: Colors.white,
                              size: 150,
                            ),
                          ))
                      : Positioned(
                          left: 80,
                          bottom: 10,
                          child: CircleAvatar(
                              radius: 100, backgroundImage: FileImage(pimage!)),
                        ),
                  Positioned(
                    left: 240,
                    bottom: 35,
                    child: InkWell(
                      onTap: changeProfilePic,
                      child: CircleAvatar(
                        radius: 10,
                        backgroundColor: Colors.blue,
                        child: Icon(
                          Icons.camera_alt,
                          size: 10,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                      left: 330,
                      bottom: 80,
                      child: InkWell(
                          onTap: changeCoverPic,
                          child: Icon(
                            Icons.add,
                            size: 20,
                            color: Colors.white,
                          )))
                ]),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Fathima Shamitha",
                style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Flutter Intern | Daily",
                    style: TextStyle(fontSize: 15, color: Colors.grey[600]),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Icon(
                    Icons.language,
                    color: Colors.blue[100],
                  )
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 70, right: 70),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconClass(myicon: "assets/images/gmail_logo.png"),
                    IconClass(myicon: "assets/images/linked_in_logo.png"),
                    IconClass(myicon: "assets/images/git_logo.png"),
                    IconClass(myicon: "assets/images/insta_logo.jpg"),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "8",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      Text(
                        "Posts",
                        style: TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Msc CS",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      Text(
                        "Qualification",
                        style: TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "23",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      Text(
                        "Age",
                        style: TextStyle(fontSize: 14),
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    height: 50,
                    width: 160,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.blue, width: 2),
                        borderRadius: BorderRadius.circular(6)),
                    child: Center(
                        child: Text(
                      "Message",
                      style: TextStyle(color: Colors.blue, fontSize: 18),
                    )),
                  ),
                  Container(
                    height: 50,
                    width: 160,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(4)),
                    child: Center(
                        child: Text(
                      "Follow",
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    )),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Row(
                  children: [
                    PhotoClass(mypic: "https://rb.gy/x9zou"),
                    PhotoClass(mypic: "https://rb.gy/hlvfv"),
                    PhotoClass(mypic: "https://shorturl.at/agjEW"),
                  ],
                ),
              ),
              SizedBox(
                height: 3,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Row(
                  children: [
                    PhotoClass(mypic: "https://shorturl.at/hjtH3"),
                    PhotoClass(mypic: "https://rb.gy/x9zou"),
                    PhotoClass(mypic: "https://shorturl.at/cBOXY"),
                  ],
                ),
              ),
              SizedBox(
                height: 3,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Row(
                  children: [
                    PhotoClass(mypic: "https://shorturl.at/eoqT9"),
                    PhotoClass(mypic: "https://shorturl.at/gCGN2"),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PhotoClass extends StatelessWidget {
  final String mypic;

  const PhotoClass({Key? key, required this.mypic}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 2),
      child: Container(
        height: 110,
        width: 110,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
        child: Image(
          image: NetworkImage(mypic),
          fit: BoxFit.fitWidth,
        ),
      ),
    );
  }
}

class IconClass extends StatelessWidget {
  final String myicon;

  const IconClass({Key? key, required this.myicon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 40,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.grey[100]),
      child: SizedBox(
        width: 20,
        height: 20,
        child: Image(
          image: AssetImage(myicon),
          fit: BoxFit.fitHeight,
        ),
      ),
    );
  }
}
