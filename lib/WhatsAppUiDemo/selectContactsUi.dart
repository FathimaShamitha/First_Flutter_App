import 'package:flutter/material.dart';

class SelectContactsClass extends StatefulWidget {
  const SelectContactsClass({Key? key}) : super(key: key);

  @override
  State<SelectContactsClass> createState() => _SelectContactsClassState();
}

class _SelectContactsClassState extends State<SelectContactsClass> {

  List Name = ["TYU", "ABC", "XYZ", "Mom", "Sis"];
  List Message = ["Available", "Busy", "Busy", "Available", "~~"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Select Contact",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              Text(
                "6 Contacts",
                style: TextStyle(color: Colors.white, fontSize: 15),
              )
            ],
          ),
          backgroundColor: Colors.teal[800],
          actions: [
            Row(
              children: [
                Icon(
                  Icons.search,
                  color: Colors.white,
                ),
                PopupMenuButton(
                  itemBuilder: (context) {
                    return [
                      PopupMenuItem(child: Text("Invite a friend")),
                      PopupMenuItem(child: Text("Contacts")),
                      PopupMenuItem(child: Text("Refresh")),
                      PopupMenuItem(child: Text("Help")),
                    ];
                  },
                  color: Colors.white,
                )
              ],
            )
          ],
        ),
        body: ListView.builder(
          itemCount: Name.length,
          itemBuilder: (context, int index) {
            if (index == 0) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    leading: CircleAvatar(
                      radius: 20,
                      backgroundColor: Colors.teal[600],
                      child: Icon(
                        Icons.people_sharp,
                        color: Colors.white,
                      ),
                    ),
                    title: Text(
                      "New group",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  ListTile(
                    leading: CircleAvatar(
                      radius: 20,
                      backgroundColor: Colors.teal[600],
                      child: Icon(
                        Icons.person_add,
                        color: Colors.white,
                      ),
                    ),
                    title: Text(
                      "New contact",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    trailing: Icon(
                      Icons.qr_code,
                      color: Colors.grey[400],
                    ),
                  ),
                  ListTile(
                    leading: CircleAvatar(
                      radius: 20,
                      backgroundColor: Colors.teal[600],
                      child: Icon(
                        Icons.people_sharp,
                        color: Colors.white,
                      ),
                    ),
                    title: Text(
                      "New community",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 35),
                    child: Text(
                      "Contacts on WhatsApp",
                      style: TextStyle(color: Colors.grey[400], fontSize: 15),
                    ),
                  )
                ],
              );
            }
            return ListTile(
              leading: CircleAvatar(
                radius: 20,
                backgroundColor: Colors.grey[400],
                child: Icon(
                  Icons.person_rounded,
                  color: Colors.white,
                ),
              ),
              title: Text(Name[index - 1]),
              subtitle: Text(Message[index - 1]),
            );
          },
        ));
  }
}
