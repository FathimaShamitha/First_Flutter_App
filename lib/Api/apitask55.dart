import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:myapplication/Api/usermodel.dart';

class Apitask5 extends StatefulWidget {
  const Apitask5({Key? key}) : super(key: key);

  @override
  State<Apitask5> createState() => _Apitask5State();
}

class _Apitask5State extends State<Apitask5> {
  List users=[];

  Future<void> getUsers()async{
    var res = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/users"));
    if(res.statusCode == 200){
      var data = jsonDecode(res.body);
      print(data[0]["name"]);
      users = data;
      print(users);

    }else{
      throw Exception("Api error");
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(builder: (BuildContext context,  snapshot) {
        return ListView.builder(itemCount: users.length,itemBuilder: (_,index){
          return Text(users[index]["name"]);
        });
      },future: getUsers(),),
    );
  }
}
