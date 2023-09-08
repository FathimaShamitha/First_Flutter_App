import 'package:flutter/material.dart';

class MyACClass extends StatefulWidget {
  const MyACClass({Key? key}) : super(key: key);

  @override
  State<MyACClass> createState() => _MyACClassState();
}

class _MyACClassState extends State<MyACClass> {

  double h = 100;
  double w = 100;
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    changeDim();
  }

  void changeDim(){
    Future.delayed(Duration(seconds: 4),(){
      setState(() {
        h = 200;
        w = 200;
      });
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 40,),
            AnimatedContainer(duration: Duration(seconds: 4),
            decoration: (BoxDecoration(
              color: Colors.green
            )),
            height: h,
            width: w,
            child: Text("Shamitha",style: TextStyle(color: Colors.white),),
              alignment: Alignment.centerLeft,
            ),
          ],
        ),
      ),
    );
  }
}
