import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

import 'myproductmodel.dart';

class MyApiBasics2Class extends StatefulWidget {
  const MyApiBasics2Class({Key? key}) : super(key: key);

  @override
  State<MyApiBasics2Class> createState() => _MyApiBasics2ClassState();
}

class _MyApiBasics2ClassState extends State<MyApiBasics2Class> {
  Future<myProductModel> getData() async {
    var res = await get(Uri.parse("https://dummyjson.com/products"));
    if (res.statusCode == 200) {
      var data = myProductModel.fromJson(jsonDecode(res.body));
      return data;
    } else {
      throw Exception("Api Error");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: FutureBuilder<myProductModel>(
        builder:
            (BuildContext context, AsyncSnapshot<myProductModel> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          /*if(snapshot.hasData){
             return Center(child: Text("${snapshot.data!.products![0].title}"));
           }*/
          if (snapshot.hasData) {
            List<Products>? myproductslist = snapshot.data!.products;
            return ListView.builder(
                itemCount: myproductslist!.length,
                itemBuilder: (_, int index) {
                  return Card(
                      elevation: 3,
                      child: Column(
                        children: [
                          SizedBox(
                              height: 150,
                              width: 150,
                              child: Image(
                                image: NetworkImage(
                                    myproductslist![index].images!.first),
                                fit: BoxFit.fitHeight,
                              )),
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Text(
                              " ${myproductslist![index].title}",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                          ),
                          Text(
                            "Price : ${myproductslist![index].price}",
                            style: TextStyle(fontSize: 15),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: Text(
                              "Rating : ${myproductslist![index].rating}",
                              style: TextStyle(fontSize: 15),
                            ),
                          )
                        ],
                      ));
                });
          } else {
            return Center(child: Text("404"));
          }
        },
        future: getData(),
      )),
    );
  }
}
