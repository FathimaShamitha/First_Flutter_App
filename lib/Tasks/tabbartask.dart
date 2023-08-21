import 'package:flutter/material.dart';

class MyTabBarClass extends StatefulWidget {
  const MyTabBarClass({Key? key}) : super(key: key);

  @override
  State<MyTabBarClass> createState() => _MyTabBarClassState();
}

class _MyTabBarClassState extends State<MyTabBarClass> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(tabs: [
            Tab(child: Text("Chats"),),
            Tab(child: Text("Status"),),
            Tab(child: Text("Calls"),),
          ],),
        ),
        body: Text("Hello"),
      ),
    );
  }
}
