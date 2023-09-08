import 'package:flutter/material.dart';

import 'instaMainPage.dart';

class MyInstaSplashClass extends StatefulWidget {
  const MyInstaSplashClass({Key? key}) : super(key: key);

  @override
  State<MyInstaSplashClass> createState() => _MyInstaSplashClassState();
}

class _MyInstaSplashClassState extends State<MyInstaSplashClass> {

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 5), (){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> MyInstagramClass()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          height: 80,
            width: 80,
            child: Image(image: NetworkImage("https://shorturl.at/gnDM5"),fit: BoxFit.fitWidth,)),
      ),
    );
  }
}
