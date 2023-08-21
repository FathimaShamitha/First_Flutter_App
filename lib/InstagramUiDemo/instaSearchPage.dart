import 'package:flutter/material.dart';

class MyInstaSearchClass extends StatefulWidget {
  const MyInstaSearchClass({Key? key}) : super(key: key);

  @override
  State<MyInstaSearchClass> createState() => _MyInstaSearchClassState();
}

class _MyInstaSearchClassState extends State<MyInstaSearchClass> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(child: Icon(Icons.add)),
      ),
    );
  }
}
