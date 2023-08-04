import 'package:flutter/material.dart';
import 'package:myapplication/SampleApp/SignUpPage.dart';

import 'LoginPage.dart';

class HomePageClass extends StatefulWidget {
  const HomePageClass({Key? key}) : super(key: key);

  @override
  State<HomePageClass> createState() => _HomePageClassState();
}

class _HomePageClassState extends State<HomePageClass> {
  int cindex = 0;
  late PageController pcntrl;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pcntrl = PageController(initialPage: cindex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: cindex,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.app_registration_outlined), label: "SignUp"),
          BottomNavigationBarItem(
              icon: Icon(Icons.login_outlined), label: "Login")
        ],
        onTap: (index) {
          setState(() {
            cindex = index;
            pcntrl.jumpToPage(index);
          });
        },
      ),
      body: PageView(
        controller: pcntrl,
        children: [SignUpClass(), LoginClass()],
      ),
    );
  }
}
