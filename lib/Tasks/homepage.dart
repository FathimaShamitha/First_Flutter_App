import 'package:flutter/material.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home),label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.sunny),label: "Weather"),
        ],
        currentIndex: cindex,
        onTap:(index){
          cindex = index;
          pcntrl.jumpToPage(index);
        },
      ),
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
