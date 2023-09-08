import 'package:flutter/material.dart';

class MyCPIClass extends StatefulWidget {
  const MyCPIClass({Key? key}) : super(key: key);

  @override
  State<MyCPIClass> createState() => _MyCPIClassState();
}

class _MyCPIClassState extends State<MyCPIClass> {

  bool isClicked = false;

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
                  AnimatedPositioned(child: CircularProgressIndicator(color: Colors.green,),
                    duration: Duration(seconds: 1),
                     top : isClicked ? 100 : -100,
                      left : 150
                  )
                ],
              ),
            ),
            ElevatedButton(onPressed: (){
              setState(() {
                isClicked = true;
                Future.delayed(Duration(seconds: 4),(){
                  setState(() {
                    isClicked = false;
                  });
                });
              });
            }, child: isClicked ? Text("x"): Text("Refresh"))
          ],
        ),
      ),
    );
  }
}
