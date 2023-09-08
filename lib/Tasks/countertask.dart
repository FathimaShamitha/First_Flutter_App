import 'package:flutter/material.dart';

import '../WidgetTasks/datepickertask.dart';


class MyCounterTask extends StatefulWidget {
  const MyCounterTask({Key? key}) : super(key: key);

  @override
  State<MyCounterTask> createState() => _MyCounterTaskState();
}

class _MyCounterTaskState extends State<MyCounterTask> {

  int count = 10;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    decCount();
  }

  void decCount(){
    Future.delayed(Duration(seconds: 1), (){
      if(count > 0){
        setState(() {
          count--;
        });
        decCount();
      }else{
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> MydatePickerClass()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("$count"),
      ),
    );
  }
}
