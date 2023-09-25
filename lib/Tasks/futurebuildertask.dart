import 'package:flutter/material.dart';

class MyFutureBuilderClass extends StatefulWidget {
  const MyFutureBuilderClass({Key? key}) : super(key: key);

  @override
  State<MyFutureBuilderClass> createState() => _MyFutureBuilderClassState();
}

class _MyFutureBuilderClassState extends State<MyFutureBuilderClass> {


  
  Future<int> getData()async{
    await Future.delayed(Duration(seconds: 6),);
    return 1;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 6), (){
     getData();
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder(builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting){
            return SizedBox(
              height: 80,
                width: 80,
                child: Image(image: AssetImage("assets/images/gmail_logo.png")));
          }
          if(snapshot.hasError){
            return Text("Error : ${snapshot.error}");
          }
          else{
            return SizedBox(
              height: 80,
                width: 80,
                child: Image(image: AssetImage("assets/images/insta_logo.jpg")));
          }
        },future: getData(),),
      )
    );
  }
}

