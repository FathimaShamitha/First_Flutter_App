import 'package:flutter/material.dart';

class MyGradientExampleClass extends StatefulWidget {
  const MyGradientExampleClass({Key? key}) : super(key: key);

  @override
  State<MyGradientExampleClass> createState() => _MyGradientExampleClassState();
}

class _MyGradientExampleClassState extends State<MyGradientExampleClass> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 200,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  gradient:
                      LinearGradient(colors: [Colors.green, Colors.blue])),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              height: 200,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  gradient:
                      RadialGradient(colors: [Colors.green, Colors.blue])),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              height: 200,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  gradient: SweepGradient(colors: [Colors.green, Colors.blue])),
            ),
          ],
        ),
      ),
    );
  }
}
