import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MySharedPrefClass extends StatefulWidget {
  const MySharedPrefClass({Key? key}) : super(key: key);

  @override
  State<MySharedPrefClass> createState() => _MySharedPrefClassState();
}

class _MySharedPrefClassState extends State<MySharedPrefClass> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  TextEditingController tc = TextEditingController();
  String my_name = "";

  Future<void> setData(myname)async{
   SharedPreferences mypref = await SharedPreferences.getInstance();

   setState(() {
     mypref.setString("name", myname);
     my_name = myname;
   });
 }

 Future<void> getData()async{
   SharedPreferences mypref = await SharedPreferences.getInstance();

   setState(() {
    my_name = mypref.getString("name") ?? "";
   });
 }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            TextFormField(
              controller: tc,
            decoration: InputDecoration(
              labelText: "Type Here",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20)
              )
            ),
            ),
            ElevatedButton(onPressed: (){
              setData(tc.text);
            }, child: Text("Get")),
            Text(my_name),
          ],
        ),
      ),
    );
  }
}
