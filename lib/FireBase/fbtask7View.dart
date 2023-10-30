import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class MyFbStorageViewClass extends StatefulWidget {
  const MyFbStorageViewClass({Key? key}) : super(key: key);

  @override
  State<MyFbStorageViewClass> createState() => _MyFbStorageViewClassState();
}

class _MyFbStorageViewClassState extends State<MyFbStorageViewClass> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: StreamBuilder(stream: FirebaseFirestore.instance.collection("MyImages").snapshots(),
          builder: (BuildContext context, snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting){
            return Center(child: CircularProgressIndicator(),);
          }
          if(snapshot.hasData){
            return GridView.builder(itemCount: snapshot.data!.docs.length,gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 1,
              crossAxisSpacing: 1
            ), itemBuilder: (context,index){
              return Container(
                height: 30,
                width: 40,
                child: Image(image: NetworkImage(snapshot.data!.docs[index]["imageurl"]),fit: BoxFit.fitHeight,),
              );
            });
          }else{
            return Center(child: Text("Error"),);
          }
          
        },),
      ),
    );
  }
}
