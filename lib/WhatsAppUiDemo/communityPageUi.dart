import 'package:flutter/material.dart';

class MyCommunitypageClass extends StatelessWidget {
  const MyCommunitypageClass({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 30,),
            Image(image: AssetImage("assets/images/community_logo.jpeg")),
            Text("Stay connected with a",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
            Text("community",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 21),),
            Text("Communities"),
            Text(""),
            Text(""),
            Text(""),
          ],
        ),
      )
    );
  }
}
