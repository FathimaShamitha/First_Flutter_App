import 'package:flutter/material.dart';

class MyRichTextClass extends StatefulWidget {  @override
  State<MyRichTextClass> createState() => MyRichTextClassState();
}

class MyRichTextClassState extends State<MyRichTextClass>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RichText(
          text: TextSpan(
            text: "Hello",
            style: DefaultTextStyle.of(context).style,
            children: [
                TextSpan(text: " World",style: TextStyle(fontWeight: FontWeight.bold))
            ]
          ),

        ),
      )
    );
  }
}




