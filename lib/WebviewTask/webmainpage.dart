import 'package:flutter/material.dart';
import 'package:myapplication/WebviewTask/webresultpage.dart';

class MyWebMainClass extends StatefulWidget {
  // const MyWebMainClass({super.key, required this.url});
  @override
  State<MyWebMainClass> createState() => _MyWebMainClassState();
}

class _MyWebMainClassState extends State<MyWebMainClass> {
  TextEditingController tc_link = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 250, left: 20, right: 20),
          child: TextFormField(
            controller: tc_link,
            decoration: InputDecoration(
                labelText: "Enter a link",
                suffixIcon: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MyWebResultClass(
                                    url: tc_link.text,
                                  )));
                    },
                    child: Icon(Icons.search)),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10))),
          ),
        ),
      ),
    );
  }
}
