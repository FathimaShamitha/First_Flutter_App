import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class MyApiBasicsclass extends StatefulWidget {
  const MyApiBasicsclass({Key? key}) : super(key: key);

  @override
  State<MyApiBasicsclass> createState() => _MyApiBasicsclassState();
}

class _MyApiBasicsclassState extends State<MyApiBasicsclass> {
  Future<Map<String, dynamic>> getData() async {
    var res = await get(Uri.parse("https://dog.ceo/api/breeds/image/random"));
    if(res.statusCode==200){
      var data = jsonDecode(res.body);
      return data;
    }else{
      throw Exception("Wrong api");
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder(
          builder: (BuildContext context, AsyncSnapshot<Map> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            } else if (snapshot.hasData) {
              return Column(
                children: [
                  Center(child: Image(image: NetworkImage("${snapshot.data!["message"]}"))),
                  Text("${snapshot.data!["status"]}"),
                  ElevatedButton(onPressed: (){
                    setState(() {
                      getData();
                    });
                    }, child: Icon(Icons.refresh))
                ],
              );
            } else {
              return Text("Something went wrong");
            }
          },
          future: getData(),
        ),
      ),
    );
  }
}
