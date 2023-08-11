import 'package:flutter/material.dart';
import 'package:myapplication/WhatsAppUiDemo/selectContactsUi.dart';
import 'package:myapplication/WhatsAppUiDemo/settingsUi.dart';

import 'newGropuUi.dart';

class MyWhatsAppClass extends StatefulWidget {
  const MyWhatsAppClass({Key? key}) : super(key: key);

  @override
  State<MyWhatsAppClass> createState() => _MyWhatsAppClassState();
}

class _MyWhatsAppClassState extends State<MyWhatsAppClass> {
  List Name = [
    "CS",
    "Mom",
    "Dad",
    "Sis",
    "Net general grp2023",
    "+91 7034933444",
    "MyJio",
    "MscCs 2020-22"
  ];
  List Message = [
    "~Shaa:okay",
    "byee",
    "haaa",
    "Heyy",
    "Aslin:hey",
    "okay",
    "Fine",
    "Okay",
    "Anjana:hmmm"
  ];
  List Time = [
    "7:53 pm",
    "5:45 pm",
    "2:15 pm",
    "yesterday",
    "yesterday",
    "25/07/2023",
    "24/07/2023",
    "23/07/2023"
  ];
  List Count = ["2", "3", "1", "7", "2", "0", "0", "0"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal[800],
        title: Text(
          "WhatsApp",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        actions: [
          Row(
            children: [
              Icon(
                Icons.camera_alt_outlined,
                color: Colors.white,
              ),
              SizedBox(
                width: 20,
              ),
              Icon(
                Icons.search_outlined,
                color: Colors.white,
              ),
              PopupMenuButton(
                onSelected: (value) {
                  if (value == 1) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => NewGroupClass()));
                  }
                  if (value == 6) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SettingsUiClass()));
                  }
                },
                itemBuilder: (BuildContext context) {
                  return [
                    PopupMenuItem(
                      child: Text("New Group"),
                      value: 1,
                    ),
                    PopupMenuItem(child: Text("New Broadcast")),
                    PopupMenuItem(child: Text("Linked Devices")),
                    PopupMenuItem(child: Text("Starred Messages")),
                    PopupMenuItem(child: Text("Payments")),
                    PopupMenuItem(
                      child: Text("Settings"),
                      value: 6,
                    )
                  ];
                },
                color: Colors.white,
              ),
            ],
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => SelectContactsClass()));
        },
        child: Icon(
          Icons.message_rounded,
          color: Colors.white,
        ),
        backgroundColor: Colors.teal[600],
      ),
      body: ListView.builder(
          itemCount: Name.length,
          itemBuilder: (context, int index) {
            return ListTile(
              leading: CircleAvatar(
                radius: 20,
                backgroundColor: Colors.grey[400],
                child: Icon(
                  Icons.person_rounded,
                  color: Colors.white,
                ),
              ),
              title: Text(Name[index]),
              subtitle: Text(Message[index]),
              trailing: Column(
                children: [
                  Text(Time[index]),
                  Count[index] == "0"
                      ? CircleAvatar(
                          radius: 10,
                          backgroundColor: Colors.white,
                        )
                      : CircleAvatar(
                          radius: 10,
                          backgroundColor: Colors.teal[500],
                          child: Center(
                              child: Text(
                            Count[index],
                            style: TextStyle(color: Colors.white),
                          )),
                        )
                ],
              ),
            );
          }),
    );
  }
}
