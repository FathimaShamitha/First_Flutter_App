import 'package:flutter/material.dart';
import 'package:myapplication/WhatsAppUiDemo/profileUi.dart';

class SettingsUiClass extends StatefulWidget {
  const SettingsUiClass({Key? key}) : super(key: key);

  @override
  State<SettingsUiClass> createState() => _SettingsUiClassState();
}

class _SettingsUiClassState extends State<SettingsUiClass> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal[800],
        title: Text(
          "Settings",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        actions: [
          Icon(
            Icons.search,
            color: Colors.white,
          )
        ],
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 20,
          ),
          ListTile(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ProfileUiClass()));
            },
            leading: CircleAvatar(
              radius: 40,
              backgroundColor: Colors.grey[400],
              child: Icon(
                Icons.person,
                color: Colors.white,
                size: 50,
              ),
            ),
            title: Text(
              "Shamitha",
              style: TextStyle(fontSize: 20),
            ),
            trailing: Icon(Icons.qr_code_sharp, color: Colors.teal[400]),
          ),
          SizedBox(
            height: 10,
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.key_sharp),
            title: Text("Account"),
            subtitle: Text("Security notifications, change number"),
          ),
          ListTile(
            leading: Icon(Icons.lock_rounded),
            title: Text("Privacy"),
            subtitle: Text("Block contacts, disappearing messages"),
          ),
          ListTile(
            leading: Icon(Icons.face_outlined),
            title: Text("Avatar"),
            subtitle: Text("Create, edit, profile photo"),
          ),
          ListTile(
            leading: Icon(Icons.chat_sharp),
            title: Text("Chats"),
            subtitle: Text("Theme, wallpapers, chat history"),
          ),
          ListTile(
            leading: Icon(Icons.notifications),
            title: Text("Notifications"),
            subtitle: Text("Message, group & call tones"),
          ),
          ListTile(
            leading: Icon(Icons.circle_outlined),
            title: Text("Storage and data"),
            subtitle: Text("Network usage, auto-download"),
          ),
          ListTile(
            leading: Icon(Icons.language_sharp),
            title: Text("App language"),
            subtitle: Text("English (phone's language)"),
          ),
          ListTile(
            leading: Icon(Icons.help_outline_sharp),
            title: Text("Help"),
            subtitle: Text("Help centre, contact us, privacy policy"),
          ),
          ListTile(
            leading: Icon(Icons.people_sharp),
            title: Text("Invite a friend"),
          ),
        ],
      ),
    );
  }
}
