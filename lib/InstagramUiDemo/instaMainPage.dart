import 'package:flutter/material.dart';

import 'instaAddPostpage.dart';
import 'instaHomePage.dart';
import 'instaProfilepage.dart';
import 'instaReelsPage.dart';
import 'instaSearchPage.dart';

class MyInstagramClass extends StatefulWidget {
  const MyInstagramClass({Key? key}) : super(key: key);

  @override
  State<MyInstagramClass> createState() => _MyInstagramClassState();
}

class _MyInstagramClassState extends State<MyInstagramClass> {
  int cindex = 0;
  late PageController pcntrl;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pcntrl = PageController(initialPage: cindex);
  }

  void change(index){
    setState(() {
      cindex = index;
      pcntrl.jumpToPage(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home_filled,
                color: Colors.black,
              ),
              label: ""),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.search,
                color: Colors.black,
              ),
              label: ""),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.add_box_outlined,
                color: Colors.black,
              ),
              label: ""),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.videocam_outlined,
                color: Colors.black,
              ),
              label: ""),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.account_circle,
                color: Colors.black,
              ),
              label: ""),
        ],
        currentIndex: cindex,
        onTap: change,
      ),
      body: PageView(
        controller: pcntrl,
         children: [
           MyInstaHomeClass(),
           MyInstaSearchClass(),
           MyInstaAddPostClass(),
           MyInstaReelsClass(),
           MyInstaProfileClass(),
         ],
      ),
    );
  }
}
