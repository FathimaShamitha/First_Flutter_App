import 'package:flutter/material.dart';

import 'amazonwebview.dart';
import 'flipkartwebview.dart';
import 'futurawebview.dart';

class MyWebClass extends StatefulWidget {
  const MyWebClass({Key? key}) : super(key: key);

  @override
  State<MyWebClass> createState() => _MyWebClassState();
}

class _MyWebClassState extends State<MyWebClass> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 50,left: 120,),
              child: ElevatedButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>MyAmazonClass()));
              }, child: Text("Amazon",style: TextStyle(fontSize: 20),)),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20,left: 120,),
              child: ElevatedButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>MyFlipkartClass()));
              }, child: Text("Flipkart",style: TextStyle(fontSize: 20),)),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20,left: 120),
              child: ElevatedButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>MyFuturaClass()));
              }, child: Text("FuturaLabs",style: TextStyle(fontSize: 20),)),
            ),
          ],
        ),
      ),
    );
  }
}
