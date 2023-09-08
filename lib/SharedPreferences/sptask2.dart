import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyShPrefClass extends StatefulWidget {
  const MyShPrefClass({Key? key}) : super(key: key);

  @override
  State<MyShPrefClass> createState() => _MyShPrefClassState();
}

class _MyShPrefClassState extends State<MyShPrefClass> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }


  bool islogin = false;

  Future<void> setData(bool isLogin)async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      pref.setBool("isLogin",isLogin );
      islogin = isLogin;
    });
  }

  Future<void> getData()async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
    islogin = pref.getBool("isLogin")??false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 100,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(onPressed: (){
                  islogin = true;
                  setData(true);
                  },child: Text("Login")),
                ElevatedButton(onPressed: (){
                  setData(false);
                  }, child: Text("Logout")),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 100),
              child: islogin?Text("You are logged in",style: TextStyle(fontSize: 25),):Text("You are logged out",style: TextStyle(fontSize: 25),),
            )
          ],
        ),
      ),
    );
  }
}
