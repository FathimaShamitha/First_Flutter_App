import 'package:flutter/material.dart';

class MyNewAppClass extends StatefulWidget {
  const MyNewAppClass({Key? key}) : super(key: key);

  @override
  State<MyNewAppClass> createState() => _MyNewAppClassState();
}

class _MyNewAppClassState extends State<MyNewAppClass> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children : [
            Positioned(
              left: -60,
                bottom: 370,
                child: Image(image: AssetImage("assets/images/meditate.png"))),
            SafeArea(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10,0,10,0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    "Meditation",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "3-10 MIN Course",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Live happier and healtheir by learning the",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text("fundamentals of meditation and",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  Text("mindfulness",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 90),
                    child: TextFormField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.search),
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(300),
                          borderSide: BorderSide.none
                        ),
                        labelText: "Search"
                      ),

                    ),
                  ),
                  SizedBox(height: 25,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SepWidgetClass(myicon: Icons.play_arrow_sharp, ht: 70, wd: 160, sess: "Session 01", clr: Colors.white, bclr: Colors.white, cclr: Colors.indigo),
                      SepWidgetClass(myicon: Icons.play_arrow_sharp, ht: 70, wd: 160, sess: "Session 02", clr: Colors.indigo, bclr: Colors.black, cclr: Colors.white),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SepWidgetClass(myicon: Icons.play_arrow_sharp, ht: 70, wd: 160, sess: "Session 03", clr: Colors.indigo, bclr: Colors.black, cclr: Colors.white),
                      SepWidgetClass(myicon: Icons.play_arrow_sharp, ht: 70, wd: 160, sess: "Session 04", clr: Colors.indigo, bclr: Colors.black, cclr: Colors.white),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SepWidgetClass(myicon: Icons.play_arrow_sharp, ht: 70, wd: 160, sess: "Session 05", clr: Colors.indigo, bclr: Colors.black, cclr: Colors.white),
                      SepWidgetClass(myicon: Icons.play_arrow_sharp, ht: 70, wd: 160, sess: "Session 06", clr: Colors.indigo, bclr: Colors.black, cclr: Colors.white),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(25,15,0,15),
                    child: Text("Meditation",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                  ),
                  Card(
                    elevation: 1,
                    child: Container(
                      height: 80,
                      width: 370,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SizedBox(
                            width: 80,
                              height: 100,
                              child: Image(image: AssetImage("assets/images/meditate.png",),fit:BoxFit.fitHeight,)),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Basics 2",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                              Text("Start your deepen your practice",style: TextStyle(fontSize: 15),),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 30),
                            child: Icon(Icons.lock_outlined,color: Colors.black,),
                          )
                        ],
                      ),
                    )
                  )
                ],
              ),
            ),

          )]
        ),
      ),
    );
  }
}

class SepWidgetClass extends StatelessWidget {

  final IconData myicon;
  final double ht;
  final double wd;
  final String sess;
  final Color clr;
  final Color bclr;
  final Color cclr;

  const SepWidgetClass({Key? key, required this.myicon, required this.ht, required this.wd, required this.sess, required this.clr, required this.bclr, required this.cclr}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      child: Container(
        height: ht,
        width: wd,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  color: cclr,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: bclr)
                ),
                child: Icon(myicon,size: 25,color: clr,),
              ),
            ),
            SizedBox(width: 3,),
            Text(sess,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),)
          ],
        ),
      ),
    );
  }
}

