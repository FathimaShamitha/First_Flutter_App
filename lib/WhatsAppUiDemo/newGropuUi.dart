import 'package:flutter/material.dart';

class NewGroupClass extends StatefulWidget {
  const NewGroupClass({Key? key}) : super(key: key);

  @override
  State<NewGroupClass> createState() => _NewGroupClassState();
}

class _NewGroupClassState extends State<NewGroupClass> {
  List Name = ["TYU", "ABC", "XYZ", "Mom", "Sis"];
  List About = ["Available", "Busy", "Busy", "Available", "~~"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "New Group",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            Text(
              "Add participants",
              style: TextStyle(color: Colors.white, fontSize: 17),
            )
          ],
        ),
        backgroundColor: Colors.teal[800],
        actions: [
          Icon(
            Icons.search,
            color: Colors.white,
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.teal[600],
        onPressed: () {},
        child: Icon(
          Icons.arrow_forward_outlined,
          color: Colors.white,
        ),
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
              subtitle: Text(About[index]),
            );
          }),
    );
  }
}
