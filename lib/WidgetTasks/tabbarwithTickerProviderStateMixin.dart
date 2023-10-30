import 'package:flutter/material.dart';
import 'package:myapplication/WidgetTasks/snackbartask.dart';

import 'carouselslider.dart';
import 'datepickertask.dart';

class TabBarTickerProviderClass extends StatefulWidget {
  const TabBarTickerProviderClass({Key? key}) : super(key: key);

  @override
  State<TabBarTickerProviderClass> createState() =>
      _TabBarTickerProviderClassState();
}

class _TabBarTickerProviderClassState extends State<TabBarTickerProviderClass>
    with TickerProviderStateMixin {
  late final TabController tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("TabBar Example"),
          bottom: TabBar(
            controller: tabController,
            tabs: [
              Tab(
                child: Icon(Icons.cloud),
              ),
              Tab(
                child: Icon(Icons.home),
              ),
              Tab(
                child: Icon(Icons.settings_outlined),
              ),
            ],
          )),
      body: TabBarView(
        controller: tabController,
        children: [
          Center(
            child: Text("Weather"),
          ),
          Center(
            child: Text("Home"),
          ),
          Center(
            child: Text("Settings"),
          ),
        ],
      ),
    );
  }
}
