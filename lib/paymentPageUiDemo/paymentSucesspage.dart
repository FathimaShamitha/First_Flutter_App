import 'package:flutter/material.dart';

class MySuccessPayClass extends StatefulWidget {
  const MySuccessPayClass({Key? key}) : super(key: key);

  @override
  State<MySuccessPayClass> createState() => _MySuccessPayClassState();
}

class _MySuccessPayClassState extends State<MySuccessPayClass> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          SizedBox(
            height: 40,
          ),
          Center(
              child: Image(
                  image: NetworkImage(
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTxGj_P_vibgkzH0gfwXObL1pVIJxONyJ_-V4IarvH6Qd3nJc3uOwfzv-vqZd-ZNFsiKIg&usqp=CAU"))),
          Text(
            "Success",
            style: TextStyle(color: Colors.blue[600], fontSize: 30),
          )
        ],
      )),
    );
  }
}
