import 'package:flutter/material.dart';

class MyCallPageClass extends StatelessWidget {
  MyCallPageClass({Key? key}) : super(key: key);

  List Name = ["Alex", "Jennie"];
  List ProfilePic = [
    "https://shorturl.at/iCKL4",
    "https://tinyurl.com/5dmf84s7"
  ];
  List Date = ["14 August", "11 August"];
  List Time = ["9:13 am", "12:20 am"];
  List<IconData> MyIcons = [Icons.call, Icons.videocam];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(
          Icons.add_call,
          color: Colors.white,
        ),
        backgroundColor: Colors.teal[600],
      ),
      body: ListView.builder(
          itemCount: Name.length + 1,
          itemBuilder: (context, int index) {
            if (index == 0) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.teal,
                      child: Center(
                        child: Icon(
                          Icons.link,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    title: Text(
                      "Create call link",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    subtitle: Text("Share a link for your WhatsApp call"),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 12),
                    child: Text(
                      "Recent",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
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
                    Text(Date[index - 1]),
                    Text(","),
                    Text(Time[index - 1]),
                  ],
                ),
                trailing: Icon(
                  MyIcons[index - 1],
                  color: Colors.teal,
                ),
              );
            }
          }),
    );
  }
}
