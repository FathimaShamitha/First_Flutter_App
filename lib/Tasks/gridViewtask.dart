import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class MyGridClass extends StatefulWidget {
  const MyGridClass({Key? key}) : super(key: key);

  @override
  State<MyGridClass> createState() => _MyGridClassState();
}

class _MyGridClassState extends State<MyGridClass> {

  void showMessage(Color c,String m){
    Fluttertoast.showToast(msg: m,backgroundColor: c,toastLength: Toast.LENGTH_SHORT);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: GridView.count(
        crossAxisCount: 4,
        primary: true,
        crossAxisSpacing: 3,
        mainAxisSpacing: 3,
        children: [
          InkWell(
              onTap: (){showMessage(Colors.redAccent,"Red");},
              child: Container(
                  height: 90,
                  width: 90,
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(10)))),
          InkWell(
              onTap: () {
                showMessage(Colors.green, "Green");
              },
              child: Container(
                  height: 90,
                  width: 90,
                  decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(10)))),
          InkWell(
              onTap: () {
                showMessage(Colors.blue, "Blue");
              },
              child: Container(
                  height: 90,
                  width: 90,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(10)))),
          InkWell(
              onTap: () {
                showMessage(Colors.orange, "Orange");
              },
              child: Container(
                  height: 90,
                  width: 90,
                  decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(10)))),
          InkWell(
            onTap: (){
              showMessage(Colors.redAccent, "RedAccent");
              },
            child: Container(
                height: 90,
                width: 90,
                decoration: BoxDecoration(
                    color: Colors.redAccent,
                    borderRadius: BorderRadius.circular(10))),
          ),
          InkWell(
            onTap: (){
              showMessage(Colors.lightGreen, "LightGreen");
              },
            child: Container(
                height: 90,
                width: 90,
                decoration: BoxDecoration(
                    color: Colors.lightGreen,
                    borderRadius: BorderRadius.circular(10))),
          ),
          InkWell(
            onTap: (){
              showMessage(Colors.lightBlue, "LightBlue");
              },
            child: Container(
                height: 90,
                width: 90,
                decoration: BoxDecoration(
                    color: Colors.lightBlue,
                    borderRadius: BorderRadius.circular(10))),
          ),
          InkWell(
            onTap: (){
              showMessage(Colors.orangeAccent, "OrangeAccent");
              },
            child: Container(
                height: 90,
                width: 90,
                decoration: BoxDecoration(
                    color: Colors.orangeAccent,
                    borderRadius: BorderRadius.circular(10))),
          ),
        ],
      )),
    );
  }
}
