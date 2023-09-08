import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyspClass extends StatefulWidget {
  const MyspClass({Key? key}) : super(key: key);

  @override
  State<MyspClass> createState() => _MyspClassState();
}

class _MyspClassState extends State<MyspClass> {

  bool islogin = false;

  Future<void> setdata()async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {

      islogin = !islogin;
      pref.setBool("isLogin",islogin );
    });
  }

  Future<void> getdata()async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      islogin = pref.getBool("isLogin")??false;
      print(islogin);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getdata();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: (){
              setdata();
            }, child: islogin?Text("You are logged in.Please Log out"):Text("Login")),
          ],
        ),
      ),
    );
  }
}
