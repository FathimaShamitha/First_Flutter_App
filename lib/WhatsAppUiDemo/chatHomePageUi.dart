import 'package:flutter/material.dart';
import 'package:myapplication/WhatsAppUiDemo/settingsUi.dart';
import 'package:myapplication/WhatsAppUiDemo/statusPageUi.dart';

import 'callsPageUi.dart';
import 'chatPageUi.dart';
import 'communityPageUi.dart';
import 'newGropuUi.dart';

class MyWhatsAppClass extends StatefulWidget {
  const MyWhatsAppClass({Key? key}) : super(key: key);

  @override
  State<MyWhatsAppClass> createState() => _MyWhatsAppClassState();
}

class _MyWhatsAppClassState extends State<MyWhatsAppClass> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      initialIndex: 1,
      child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: [
                Tab(
                  child: Icon(
                    Icons.groups,
                    color: Colors.white,
                    size: 25,
                  ),
                ),
                Tab(
                    child: Text("Chats",
                        style: TextStyle(color: Colors.white, fontSize: 18))),
                Tab(
                    child: Text("Status",
                        style: TextStyle(color: Colors.white, fontSize: 18))),
                Tab(
                    child: Text("Calls",
                        style: TextStyle(color: Colors.white, fontSize: 18))),
              ],
              indicatorColor: Colors.white,
            ),
            backgroundColor: Colors.teal[800],
            title: Text(
              "WhatsApp",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            actions: [
              Row(
                children: [
                  Icon(
                    Icons.camera_alt_outlined,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Icon(
                    Icons.search_outlined,
                    color: Colors.white,
                  ),
                  PopupMenuButton(
                    onSelected: (value) {
                      if (value == 1) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => NewGroupClass()));
                      }
                      if (value == 6) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SettingsUiClass()));
                      }
                    },
                    itemBuilder: (BuildContext context) {
                      return [
                        PopupMenuItem(
                          child: Text("New Group"),
                          value: 1,
                        ),
                        PopupMenuItem(child: Text("New Broadcast")),
                        PopupMenuItem(child: Text("Linked Devices")),
                        PopupMenuItem(child: Text("Starred Messages")),
                        PopupMenuItem(child: Text("Payments")),
                        PopupMenuItem(
                          child: Text("Settings"),
                          value: 6,
                        )
                      ];
                    },
                    color: Colors.white,
                  ),
                ],
              )
            ],
          ),
          body: TabBarView(
            children: [
              MyCommunitypageClass(),
              MyChatPageClass(),
              MyStatusPageClass(),
              MyCallPageClass(),
            ],
          )),
    );
  }
}