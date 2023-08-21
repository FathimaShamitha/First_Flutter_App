import 'package:flutter/material.dart';

class MyInstaProfileClass extends StatefulWidget {
  const MyInstaProfileClass({Key? key}) : super(key: key);

  @override
  State<MyInstaProfileClass> createState() => _MyInstaProfileClassState();
}

class _MyInstaProfileClassState extends State<MyInstaProfileClass> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("_sha_mitha"),
        actions: [
          Row(
            children: [
              Icon(Icons.add_box_outlined),
              SizedBox(width: 15,),
              Icon(Icons.menu),
              SizedBox(width: 25,)
            ],
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    CircleAvatar(
                      radius: 40,
                      backgroundColor: Colors.black12,
                      child: Icon(Icons.person,color: Colors.white,size: 50,),
                    ),
                    Text("Shamitha")
                  ],
                ),
                Column(
                  children: [
                    Text("0",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                    Text("Posts")
                  ],
                ),
                Column(
                  children: [
                    Text("241",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                    Text("Followers")
                  ],
                ),
                Column(
                  children: [
                    Text("206",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                    Text("Following"),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  width: 150,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.black12
                  ),
                  child: Center(child: Text("Edit Profile",style: TextStyle(fontWeight: FontWeight.bold),)),
                ),
                Container(
                  width: 150,
                  height: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.black12
                  ),
                  child: Center(child: Text("Share Profile",style: TextStyle(fontWeight: FontWeight.bold),)),
                ),
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.black12
                  ),
                  child: Center(child: Icon(Icons.person_add_outlined,color: Colors.black,)),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10,right: 220,bottom: 10),
              child: Text("Story Highlights",style: TextStyle(fontWeight: FontWeight.bold),),
            ),
          ]
        ),
      ),
    );
  }
}
