import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MydatePickerClass extends StatefulWidget {
  const MydatePickerClass({Key? key}) : super(key: key);

  @override
  State<MydatePickerClass> createState() => _MydatePickerClassState();
}

class _MydatePickerClassState extends State<MydatePickerClass> {

  TextEditingController tc = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: TextField(
          controller: tc,
          onTap: () async{
            final DateTime? dt = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(1999),
                lastDate: DateTime(2050),
            );
            if(dt != null){
              setState(() {
                tc.text = dt.toString();
              });
            }
            },
        ),
      ),
    );
  }
}
