import 'package:flutter/material.dart';

class MyHeroClass extends StatefulWidget {
  const MyHeroClass({Key? key}) : super(key: key);

  @override
  State<MyHeroClass> createState() => _MyHeroClassState();
}

class _MyHeroClassState extends State<MyHeroClass> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InkWell(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (_)=>MyHeroClass2()));
          },
          child: Hero(
            tag: "Herotag",
            child: Container(
              height: 100,
              width: 100,
              color: Colors.red,
            ),
          ),
        ),
      ),
    );
  }
}

class MyHeroClass2 extends StatelessWidget {
  const MyHeroClass2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Hero(
          tag:"Herotag",
          child: Container(
            height: 200,
            width: 200,
            color: Colors.red,
          ),
        ),
      )
    );
  }
}

