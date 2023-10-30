import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MyApi6Class extends StatefulWidget {
  @override
  State<MyApi6Class> createState() => _MyApi6ClassState();
}

class _MyApi6ClassState extends State<MyApi6Class> {
  List posts = [];

  Future<void> getPosts() async {
    var res =
        await http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));
    if (res.statusCode == 200) {
      var data = jsonDecode(res.body);
      posts = data;
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
                itemCount: posts.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: Column(
                      children: [
                        Text(
                          "${posts[index]["title"]}",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 10, right: 10, top: 10, bottom: 10),
                          child: Text("${posts[index]["body"]}"),
                        ),
                      ],
                    ),
                  );
                });
          },
          future: getPosts(),
        ),
      ),
    );
  }
}
