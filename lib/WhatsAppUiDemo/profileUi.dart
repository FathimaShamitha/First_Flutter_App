import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfileUiClass extends StatefulWidget {
  const ProfileUiClass({Key? key}) : super(key: key);

  @override
  State<ProfileUiClass> createState() => _ProfileUiClassState();
}

class _ProfileUiClassState extends State<ProfileUiClass> {
  File? profile_pic;

  Future<void> changeProfilePic() async {
    var pic = await ImagePicker().pickImage(source: ImageSource.gallery);

    setState(() {
      profile_pic = File(pic!.path);
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: Icon(Icons.arrow_back_outlined,color: Colors.white,),
        title: Text(
          "Profile",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        backgroundColor: Colors.teal[800],
      ),
      body: Column(
        children: [
          SizedBox(
            height: 40,
          ),
          Container(
            height: 200,
            width: 500,
            child: Center(
              child: Stack(
                children: [
                  profile_pic == null
                      ? CircleAvatar(
                          radius: 100,
                          backgroundColor: Colors.black12,
                          child: Icon(
                            Icons.person,
                            size: 150,
                            color: Colors.white,
                          ),
                        )
                      : InkWell(
                    onTap: (){
                     Navigator.push(context, MaterialPageRoute(builder: (_)=>MyProfileViewClass(pic: profile_pic))) ;
                    },
                    child: Hero(
                      tag: "profilepictag",
                      child: CircleAvatar(
                        radius: 100,
                        backgroundColor: Colors.grey[600],
                        backgroundImage: FileImage(profile_pic!),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 140,
                    left: 140,
                    child: CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.teal[600],
                      child: InkWell(
                          onTap: () {
                            changeProfilePic();
                          },
                          child: Icon(
                            Icons.camera_alt,
                            color: Colors.white,
                          )),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          ListTile(
            leading: Icon(Icons.person_rounded),
            title: Text(
              "Shamitha",
              style: TextStyle(fontSize: 20),
            ),
            subtitle: Text(
                "This is not your username or pin. This name will be visible to your whatsapp contacts."),
            trailing: Icon(
              Icons.edit,
              color: Colors.green[700],
            ),
          ),
          ListTile(
            leading: Icon(Icons.info_outline),
            title: Text("About"),
            trailing: Icon(
              Icons.edit,
              color: Colors.green[700],
            ),
          ),
          ListTile(
            leading: Icon(Icons.phone),
            title: Text("Phone"),
            subtitle: Text(
              "+91 8606988681",
              style: TextStyle(fontSize: 20),
            ),
          )
        ],
      ),
    );
  }
}

class MyProfileViewClass extends StatelessWidget {

  final File? pic;
  const MyProfileViewClass({Key? key, required this.pic}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Profile photo",style: TextStyle(fontSize: 20,color: Colors.white),),
        actions: [
          Row(
            children: [
              Icon(Icons.edit,color: Colors.white,),
              SizedBox(width: 20,),
              Icon(Icons.share,color: Colors.white,),
              SizedBox(width: 20,)
            ],
          )
        ],
      ),
      body: Container(
        height: 700,
        width: MediaQuery.of(context).size.width,
        child: Image(image: FileImage(pic!),),
      ),
      backgroundColor: Colors.black,
    );
  }
}

