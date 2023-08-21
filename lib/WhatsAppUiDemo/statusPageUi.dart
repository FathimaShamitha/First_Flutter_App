import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class MyStatusPageClass extends StatefulWidget {
  MyStatusPageClass({Key? key}) : super(key: key);

  @override
  State<MyStatusPageClass> createState() => _MyStatusPageClassState();
}

class _MyStatusPageClassState extends State<MyStatusPageClass> {
  List ProfilePic = [
    "https://shorturl.at/iCKL4",
    "https://shorturl.at/anuQV",
    "https://tinyurl.com/5dmf84s7",
  ];

  List Name = ["Alex", "Mary", "Jennie"];

  List Day = ["Today", "Today", "Yesterday"];

  List Time = ["9:53 am", "6:45 am", "10:15 pm"];

  File? mypic;

  Future<void> setStatus() async {
    var img = await ImagePicker().pickImage(source: ImageSource.gallery);

    setState(() {
      mypic = File(img!.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton:
          Column(mainAxisAlignment: MainAxisAlignment.end, children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: Container(
            height: 40,
            width: 40,
            child: FloatingActionButton(
              onPressed: () {},
              child: Icon(
                Icons.edit,
                color: Colors.white,
              ),
              backgroundColor: Colors.grey,
            ),
          ),
        ),
        FloatingActionButton(
          onPressed: () {
            setStatus();
          },
          child: Icon(
            Icons.camera_alt,
            color: Colors.white,
          ),
          backgroundColor: Colors.teal[600],
        ),
      ]),
      body: ListView.builder(
          itemCount: Name.length + 1,
          itemBuilder: (context, int index) {
            if (index == 0) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  mypic == null
                      ? ListTile(
                          leading: Stack(children: [
                            CircleAvatar(
                              radius: 30,
                              backgroundColor: Colors.grey,
                              child: Icon(
                                Icons.person,
                                color: Colors.white,
                                size: 40,
                              ),
                            ),
                            Positioned(
                              top: 30,
                              left: 40,
                              child: CircleAvatar(
                                radius: 10,
                                backgroundColor: Colors.teal,
                                child: InkWell(
                                    onTap: setStatus,
                                    child: Icon(
                                      Icons.add,
                                      color: Colors.white,
                                      size: 20,
                                    )),
                              ),
                            )
                          ]),
                          title: Text(
                            "My status",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                          subtitle: Text("Tap to add status update"),
                        )
                      : Stack(children: [
                          ListTile(
                            leading: CircleAvatar(
                              radius: 30,
                              backgroundImage: FileImage(mypic!),
                            ),
                            title: Text(
                              "My status",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                            subtitle: Text("Tap to add status update"),
                          ),
                          Positioned(
                            top: 40,
                            left: 50,
                            child: CircleAvatar(
                              radius: 10,
                              backgroundColor: Colors.teal,
                              child: InkWell(
                                  onTap: setStatus,
                                  child: Icon(
                                    Icons.add,
                                    color: Colors.white,
                                    size: 20,
                                  )),
                            ),
                          )
                        ]),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text("Recent updates"),
                  )
                ],
              );
            } else {
              return ListTile(
                leading: CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage(ProfilePic[index - 1]),
                ),
                title: Text(
                  Name[index - 1],
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                subtitle: Row(
                  children: [
                    Text(Day[index - 1]),
                    Text(","),
                    Text(Time[index - 1]),
                  ],
                ),
              );
            }
          }),
    );
  }
}
