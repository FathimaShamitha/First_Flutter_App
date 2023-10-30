import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'fbtask6.dart';

class MyFirebaseReadClass extends StatefulWidget {
  const MyFirebaseReadClass({Key? key}) : super(key: key);

  @override
  State<MyFirebaseReadClass> createState() => _MyFirebaseReadClassState();
}

class _MyFirebaseReadClassState extends State<MyFirebaseReadClass> {

  TextEditingController tc_phone = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection("Users").snapshots(),
        builder: (BuildContext context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasError) {
            return Center(
              child: Text("Error!!!"),
            );
          }
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (_, index) {
                  return InkWell(
                    /*onTap: (){
                 Navigator.push(context, MaterialPageRoute(builder: (context)=>MyDataViewClass(name: snapshot.data!.docs[index].data()["name"],)));
               }*/
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MySingleProfileViewClass(
                                    doc_id: snapshot.data!.docs[index].id,
                                  )));
                    },
                    child: Card(
                      elevation: 2,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 5),
                            child: Text(
                                "Name : ${snapshot.data!.docs[index].data()["name"].toString()}"),
                          ),
                          Text(
                              "Email : ${snapshot.data!.docs[index].data()["email"].toString()}"),
                          TextField(
                            controller: tc_phone,
                            /*onChanged: (text){
                              tc_phone.text = snapshot.data!.docs[index].data()["phone_no"].toString();
                            },*/
                          ),
                          Text(
                              "Phone No : ${snapshot.data!.docs[index].data()["phone_no"].toString()}"),
                          Padding(
                            padding: const EdgeInsets.only(left: 300),
                            child: IconButton(
                                onPressed: () async {
                                  await FirebaseFirestore.instance
                                      .collection("Users")
                                      .doc(snapshot.data!.docs[index].id)
                                      .delete();
                                  setState(() {});
                                },
                                icon: Icon(Icons.delete)),
                          )
                        ],
                      ),
                    ),
                  );
                });
          } else {
            return Center(child: Text("Some error has occured"));
          }
        },
      ),
    );
  }
}
