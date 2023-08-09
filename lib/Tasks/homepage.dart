import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:myapplication/Tasks/uidesigntask.dart';
import 'package:myapplication/Tasks/weatheruitask.dart';

class MyHomePageClass extends StatefulWidget {
  const MyHomePageClass({Key? key}) : super(key: key);

  @override
  State<MyHomePageClass> createState() => _MyHomePageClassState();
}

class _MyHomePageClassState extends State<MyHomePageClass> {

   late PageController pcntrl;
   int cindex = 0;

   @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      pcntrl = PageController(initialPage: cindex);
    });

  }
  void change(index)async{
   setState(() {
     cindex = index;
     pcntrl.jumpToPage(index);

   });
   await Fluttertoast.showToast(msg: "page changed",gravity: ToastGravity.SNACKBAR,toastLength: Toast.LENGTH_LONG,backgroundColor: Colors.red,webShowClose: true);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
         selectedItemColor: Colors.blue[400],
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home),label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.sunny),label: "Weather"),
        ],
        // unselectedItemColor: Colors.green,
        currentIndex: cindex,
        onTap:change,
      ),
      /*bottomNavigationBar: CurvedNavigationBar(
        items: [
          Icon(Icons.home,),
          Icon(Icons.sunny,),
        ],
        onTap: change,
      ),*/
      body: PageView(
        controller: pcntrl,
        children: [
          MyNewAppClass(),
          WeatherClass()
        ],
      ),
    );
  }
}
