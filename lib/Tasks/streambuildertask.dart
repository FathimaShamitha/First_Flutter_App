import 'dart:async';

import 'package:flutter/material.dart';

class MyStraemBuilderClass extends StatefulWidget {
  const MyStraemBuilderClass({Key? key}) : super(key: key);

  @override
  State<MyStraemBuilderClass> createState() => _MyStraemBuilderClassState();
}

class _MyStraemBuilderClassState extends State<MyStraemBuilderClass> {

  int counter = 0;
  StreamController<int> streamController = StreamController<int>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer.periodic(Duration(seconds: 2), (timer) {
      streamController.add(counter++);
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    streamController.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: StreamBuilder<int>(builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
            if(snapshot.hasError){
              return Text("Error");
            }
            if(snapshot.hasData){
              return Text("${snapshot.data}");
            }
            else{
              return Text("Something went wrong");
            }
          },stream: streamController.stream,),
        ),
      ),
    );
  }
}
