import 'package:flutter/material.dart';

class MyInstaAddPostClass extends StatefulWidget {
  const MyInstaAddPostClass({Key? key}) : super(key: key);

  @override
  State<MyInstaAddPostClass> createState() => _MyInstaAddPostClassState();
}

class _MyInstaAddPostClassState extends State<MyInstaAddPostClass> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  SafeArea(
    child: Center(child: Icon(Icons.add)),
    ),
    );
  }
}
