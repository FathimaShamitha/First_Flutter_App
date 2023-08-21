import 'package:flutter/material.dart';

class MyInstaReelsClass extends StatefulWidget {
  const MyInstaReelsClass({Key? key}) : super(key: key);

  @override
  State<MyInstaReelsClass> createState() => _MyInstaReelsClassState();
}

class _MyInstaReelsClassState extends State<MyInstaReelsClass> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(child: Icon(Icons.add)),
      ),
    );
  }
}
