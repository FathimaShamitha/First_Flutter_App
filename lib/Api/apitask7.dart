import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class MyApi7Class extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _MyApi7ClassState();

}

class _MyApi7ClassState extends State<MyApi7Class>{

  List photolist = [];

  Future<void> getPhotos()async{
    var res = await get(Uri.parse("https://jsonplaceholder.typicode.com/photos"));
    if(res.statusCode == 200){
      var data = jsonDecode(res.body);
      photolist = data;
    }else{
      throw Exception("Api Error");
    }
  }

  @override
  Widget build(BuildContext context) {
   return Scaffold(
     body: SafeArea(
       child: FutureBuilder(builder: (BuildContext context,snapshot) {
         return ListView.builder(itemCount: photolist.length,itemBuilder: (_,index){
           return Card(
             child: Column(
               children: [
                 Padding(
                   padding: const EdgeInsets.only(top: 20,bottom: 10,),
                   child: Image(image: NetworkImage(photolist[index]["thumbnailUrl"])),
                 ),
                 Padding(
                   padding: const EdgeInsets.only(top: 10,left: 10,right: 10,bottom: 10),
                   child: Text("${photolist[index]["title"]}"),
                 ),
               ],
             ),
           );
         });
       },future: getPhotos(),),
     ),
   );
  }
}