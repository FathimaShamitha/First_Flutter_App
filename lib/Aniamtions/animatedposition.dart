import 'package:flutter/material.dart';

class MyAPClass extends StatefulWidget {
  const MyAPClass({Key? key}) : super(key: key);

  @override
  State<MyAPClass> createState() => _MyAPClassState();
}

class _MyAPClassState extends State<MyAPClass> {

  // double t = 100;
  // double l = 20;
  bool isClicked = false;


  // void changeSize(){
  //   setState(() {
  //     t = 200;
  //     l = 70;
  //   });
  // }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 400,
              child: Stack(
                children: [
                  AnimatedPositioned(
                    duration: Duration(seconds: 5),
                    top: isClicked ? 200 : 100,
                    left: isClicked ? 100 : 50,
                    child: Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.blue
                      ),
                    ),
                  ),
                ],
              ),
            ),
            ElevatedButton(onPressed: (){
             setState(() {
               isClicked = !isClicked;
             });
            }, child: Text("Click Here")),
          ],
        ),
      ),
    );
  }
}
