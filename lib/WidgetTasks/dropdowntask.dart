import 'package:flutter/material.dart';

class MyDropDownClass extends StatefulWidget {
  const MyDropDownClass({Key? key}) : super(key: key);

  @override
  State<MyDropDownClass> createState() => _MyDropDownClassState();
}

class _MyDropDownClassState extends State<MyDropDownClass> {
  List<String> month = [
    "Jan",
    "Feb",
    "Mar",
    "Apr",
    "May",
    "Jun",
    "Jul",
    "Aug",
    "Sep",
    "Oct",
    "Nov",
    "Dec"
  ];

  String selected_month = "Jan";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          DropdownButton(
              value: selected_month,
              items: month.map((String m) {
                return DropdownMenuItem(
                  child: Text(m),
                  value: m,
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selected_month = value.toString();
                });
              })
        ],
      )),
    );
  }
}
