import 'package:flutter/material.dart';
import 'package:myapplication/WhatsAppUiDemo/selectContactsUi.dart';

class MyChatPageClass extends StatelessWidget {
  MyChatPageClass({Key? key}) : super(key: key);

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
                radius: 30,
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
