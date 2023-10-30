import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class MySingleProfileViewClass extends StatefulWidget {
  const MySingleProfileViewClass({Key? key, required this.doc_id}) : super(key: key);
  
  final doc_id;

  @override
  State<MySingleProfileViewClass> createState() => _MySingleProfileViewClassState();
}

class _MySingleProfileViewClassState extends State<MySingleProfileViewClass> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     /* appBar: AppBar(
        actions: [Icon(Icons.account_circle_outlined)],
      ),*/
      body: SafeArea(
        child: StreamBuilder(
          stream: FirebaseFirestore.instance.collection("Users").doc(widget.doc_id).snapshots(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) { 
            if(snapshot.connectionState == ConnectionState.waiting){
              return Center(child: CircularProgressIndicator(),);
            }
            if(snapshot.hasError){
              return Center(child: Text("Erroe!!!!"),);
            }
            if(snapshot.hasData){
              return Column(
                children: [
                  SizedBox(height: 20,),
                  Center(
                    child: Icon(Icons.account_circle,size: 120,color: Colors.blue,),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5,),
                    child: Text(snapshot.data["name"],style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                  ),
                  Text(snapshot.data["email"],style: TextStyle(fontSize: 17),),
                ],
              );
            }
            else{
              return Center(child: Text("Something went wrong"),);
            }
          },),
      ),
    );
  }
}
