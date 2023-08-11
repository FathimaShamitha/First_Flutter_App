import 'package:flutter/material.dart';

class AccountSettingsClass extends StatefulWidget {
  const AccountSettingsClass({Key? key}) : super(key: key);

  @override
  State<AccountSettingsClass> createState() => _AccountSettingsClassState();
}

class _AccountSettingsClassState extends State<AccountSettingsClass> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal[800],
        title: Text("Account",style: TextStyle(color: Colors.white,fontSize: 20),),
      ),
      body: ListView(
        children: [
          ListTile(
            leading: Icon(Icons.security_rounded),
            title: Text("Security notifications"),
          ),
          ListTile(
            leading: Icon(Icons.security_rounded),
            title: Text("Security notifications"),
          ),
          ListTile(
            leading: Icon(Icons.security_rounded),
            title: Text("Security notifications"),
          ),
          ListTile(
            leading: Icon(Icons.security_rounded),
            title: Text("Security notifications"),
          ),
        ],
      ),
    );
  }
}
