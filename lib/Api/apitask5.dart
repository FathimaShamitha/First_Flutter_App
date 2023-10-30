import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
class MyApi5Class extends StatefulWidget {
  const MyApi5Class({Key? key}) : super(key: key);

  @override
  State<MyApi5Class> createState() => _MyApi5ClassState();
}

class _MyApi5ClassState extends State<MyApi5Class> {
  List userlist = [];

  Future<void> getUsers() async {
    var res =
        await get(Uri.parse("https://jsonplaceholder.typicode.com/users"));
    if (res.statusCode == 200) {
      var data = jsonDecode(res.body);
      userlist = data;
    } else {
      throw Exception("Api Error");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder(
          builder: (BuildContext context, snapshot) {
            return ListView.builder(
                itemCount: userlist.length,
                itemBuilder: (_, index) {
                  return Card(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Center(
                            child: Text(
                          "Personal Details",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        )),
                        Divider(
                          thickness: 3,
                          color: Colors.black,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Name  ",style: TextStyle(fontWeight: FontWeight.bold),),
                                  Text("UserName  ",style: TextStyle(fontWeight: FontWeight.bold),),
                                  Text("Email  ",style: TextStyle(fontWeight: FontWeight.bold),),
                                  Text("Phone  ",style: TextStyle(fontWeight: FontWeight.bold),),
                                  Text("Website  ",style: TextStyle(fontWeight: FontWeight.bold),),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("${userlist[index]["name"]}"),
                                  Text("${userlist[index]["username"]}"),
                                  Text("${userlist[index]["email"]}"),
                                  Text("${userlist[index]["phone"]}"),
                                  Text("${userlist[index]["website"]}"),
                                ],
                              ),
                            )
                          ],
                        ),
                        Divider(),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text(
                            "Adress ",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 40),
                          child:
                              Text(" ${userlist[index]["address"]["street"]}"),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 40),
                          child:
                              Text(" ${userlist[index]["address"]["suite"]}"),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 40),
                          child: Text(" ${userlist[index]["address"]["city"]}"),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 40),
                          child:
                              Text(" ${userlist[index]["address"]["zipcode"]}"),
                        ),
                        Divider(),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text(
                            "Company Details ",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 40),
                          child: Text(" ${userlist[index]["company"]["name"]}"),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 40),
                          child: Text(
                              " ${userlist[index]["company"]["catchPhrase"]}"),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 40),
                          child: Text(" ${userlist[index]["company"]["bs"]}"),
                        ),
                        Divider(),
                        SizedBox(
                          height: 10,
                        )
                      ],
                    ),
                  );
                });
          },
          future: getUsers(),
        ),
      ),
    );
  }
}
