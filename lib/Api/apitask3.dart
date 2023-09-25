import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

import 'myusermodel.dart';

class MyApiBasics3Class extends StatefulWidget {
  const MyApiBasics3Class({Key? key}) : super(key: key);

  @override
  State<MyApiBasics3Class> createState() => _MyApiBasics3ClassState();
}

class _MyApiBasics3ClassState extends State<MyApiBasics3Class> {
  Future<myUserModel> getData() async {
    var res = await get(Uri.parse("https://dummyjson.com/users"));
    if (res.statusCode == 200) {
      var data = myUserModel.fromJson(jsonDecode(res.body));
      return data;
    } else {
      throw Exception("Api Error");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder<myUserModel>(
          builder: (BuildContext context, AsyncSnapshot<myUserModel> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasData) {
              List<Users>? myuserlist = snapshot.data!.users;
              return ListView.builder(
                  itemCount: myuserlist!.length,
                  itemBuilder: (context, int index) {
                    return Card(
                      child: Column(
                        children: [
                          Image(image: NetworkImage(myuserlist[index]!.image!)),
                          Text("First Name : ${myuserlist[index]!.firstName}"),
                          Text("Last Name : ${myuserlist[index]!.lastName}"),
                          Text(
                              "Maiden Name : ${myuserlist[index]!.maidenName}"),
                          Text("Age : ${myuserlist[index]!.age}"),
                          Text("Gender : ${myuserlist[index]!.gender}"),
                          Text("Email : ${myuserlist[index]!.email}"),
                          Text("Phone : ${myuserlist[index]!.phone}"),
                        ],
                      ),
                    );
                  });
            } else {
              return Text("Something Went Wrong");
            }
          },
          future: getData(),
        ),
      ),
    );
  }
}
