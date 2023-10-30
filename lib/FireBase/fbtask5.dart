import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class MyDataViewClass extends StatefulWidget {
  const MyDataViewClass({Key? key, required this.name}) : super(key: key);
  final name;

  @override
  State<MyDataViewClass> createState() => _MyDataViewClassState();
}

class _MyDataViewClassState extends State<MyDataViewClass> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection("Users")
              .where("name", isEqualTo: widget.name)
              .snapshots(),
          builder: (BuildContext context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if (snapshot.hasError) {
              return Center(
                child: Text("Error!!!!!!!"),
              );
            }
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (_, index) {
                    return Card(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 5),
                            child: Text(
                                "Name : ${snapshot.data!.docs[index].data()["name"]}"),
                          ),
                          Text(
                              "Email : ${snapshot.data!.docs[index].data()["email"]}"),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 5),
                            child: Text(
                                "Phone : ${snapshot.data!.docs[index].data()["phone_no"]}"),
                          ),
                        ],
                      ),
                    );
                  });
            } else {
              return Center(
                child: Text("Something went wrong!!!"),
              );
            }
          },
        ),
      ),
    );
  }
}
