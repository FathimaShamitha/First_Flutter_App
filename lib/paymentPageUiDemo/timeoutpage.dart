import 'package:flutter/material.dart';

class MyTimeOutClass extends StatefulWidget {
  const MyTimeOutClass({Key? key}) : super(key: key);

  @override
  State<MyTimeOutClass> createState() => _MyTimeOutClassState();
}

class _MyTimeOutClassState extends State<MyTimeOutClass> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        SizedBox(
          height: 50,
        ),
        Image(
            image: NetworkImage(
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ7HZ8atdQSEHHZP7aAqosBkyItHgIMCGxpPA&usqp=CAU")),
        Center(
          child: Text(
            "504",
            style: TextStyle(
                fontSize: 45,
                fontWeight: FontWeight.bold,
                color: Colors.blue[800]),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          "Session TimeOut!!!",
          style: TextStyle(fontSize: 20, color: Colors.blue[800]),
        ),
      ],
    ));
  }
}
