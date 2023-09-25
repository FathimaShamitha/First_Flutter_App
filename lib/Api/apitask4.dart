import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class MyApi4Calss extends StatefulWidget {
  const MyApi4Calss({Key? key}) : super(key: key);

  @override
  State<MyApi4Calss> createState() => _MyApi4CalssState();
}

class _MyApi4CalssState extends State<MyApi4Calss> {

  TextEditingController nameController = TextEditingController();
  TextEditingController passController = TextEditingController();
  GlobalKey<FormState> fkey = GlobalKey();
  
  Future<void> getData(name,password)async{
    var res = await http.post(Uri.parse("https://dummy.restapiexample.com/api/v1/create"),
        body:{
      "name" : name, "password": password}
    );
    if(res.statusCode == 200){
      print("Registration Success ${res.body}");
    }else{
      throw Exception("Error");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: SafeArea(
         child: Form(
           key: fkey,
           child: Column(
             mainAxisAlignment: MainAxisAlignment.center,
             children: [
               Padding(
                 padding: const EdgeInsets.only(bottom: 20,left: 20,right: 20),
                 child: TextFormField(
                   controller: nameController,
                   validator: (value) {
                     if(value!.isEmpty){
                       return "The field cannot be empty";
                     }
                   },
                   decoration: InputDecoration(
                     labelText: "Name",
                     border: OutlineInputBorder(
                       borderRadius: BorderRadius.circular(40),
                     )
                   ),
                 ),
               ),
               Padding(
                 padding: const EdgeInsets.only(bottom: 30,left: 20,right: 20),
                 child: TextFormField(
                   controller: passController,
                   validator: (value) {
                     if(value!.isEmpty){
                       return "Field cannot be empty";
                     }
                   },
                   decoration: InputDecoration(
                       labelText: "Password",
                       border: OutlineInputBorder(
                         borderRadius: BorderRadius.circular(40),
                       )
                   ),
                 ),
               ),
               ElevatedButton(onPressed: (){
                 if(fkey.currentState!.validate()){
                   getData(nameController.text, passController.text);
                 }
                 }, child: Text("Submit"))
             ],
           ),
         )
       ),
    );
  }
}
