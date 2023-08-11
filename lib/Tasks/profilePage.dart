import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfileClass extends StatefulWidget {
  const ProfileClass({Key? key}) : super(key: key);

  @override
  State<ProfileClass> createState() => _ProfileClassState();
}

class _ProfileClassState extends State<ProfileClass> {
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
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Container(
              height: 200,
              width: MediaQuery.of(context).size.width,
              child: Stack(
                children: [
                  InkWell(
                    onTap: changeCoverPic,
                    child: cimage == null
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
                  ),
                  InkWell(
                    onTap: changeProfilePic,
                    child: pimage == null
                        ? Padding(
                            padding: const EdgeInsets.only(left: 80, top: 50),
                            child: CircleAvatar(
                              radius: 100,
                              backgroundColor: Colors.grey[100],
                              child: Icon(
                                Icons.person,
                                color: Colors.white,
                                size: 150,
                              ),
                            ),
                          )
                        : Padding(
                            padding: const EdgeInsets.only(left: 80, top: 50),
                            child: CircleAvatar(
                                radius: 100,
                                backgroundImage: FileImage(pimage!)),
                          ),
                  ),
                ],
              ),
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
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
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
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
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
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
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
            Flexible(
              child: GridView.count(
                crossAxisCount: 3,
                primary: true,
                mainAxisSpacing: 2,
                crossAxisSpacing: 2,
                children: [
                  PhotoClass(mypic: "https://rb.gy/x9zou"),
                  PhotoClass(mypic: "https://rb.gy/hlvfv"),
                  PhotoClass(mypic: "https://shorturl.at/agjEW"),
                  PhotoClass(mypic: "https://shorturl.at/hjtH3"),
                  PhotoClass(mypic: "https://rb.gy/x9zou"),
                  PhotoClass(mypic: "https://shorturl.at/cBOXY"),
                  PhotoClass(mypic: "https://shorturl.at/eoqT9"),
                  PhotoClass(mypic: "https://shorturl.at/gCGN2"),
                ],
              ),
            )
          ],
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

class PhotoClass extends StatelessWidget {
  final String mypic;

  const PhotoClass({Key? key, required this.mypic}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: 70,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
      child: Image(
        image: NetworkImage(mypic),
        fit: BoxFit.fitWidth,
      ),
    );
  }
}
