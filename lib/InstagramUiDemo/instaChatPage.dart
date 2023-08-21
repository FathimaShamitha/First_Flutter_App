import 'package:flutter/material.dart';

class MyInstaChatClass extends StatefulWidget {
  const MyInstaChatClass({Key? key}) : super(key: key);

  @override
  State<MyInstaChatClass> createState() => _MyInstaChatClassState();
}

class _MyInstaChatClassState extends State<MyInstaChatClass> {

  List user_name = ["am_al_sh_an","Shanus","SHILPA","Aj"];
  List profile_pic = ["","https://shorturl.at/anuQV", "https://tinyurl.com/5dmf84s7",""];
  List message = ["Sent a reel by _humour_k","sent a reel by dark_world","sent a reel by visit_once","Seen"];
  List time = ["3 w","6 w","12 w",""];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("_sha_mitha"),
        actions: [
          Row(
            children: [
              Icon(Icons.video_call_outlined),
              SizedBox(width: 15,),
              Icon(Icons.edit_outlined),
              SizedBox(width: 25,),
            ],
          )
        ],
      ),
      body: ListView.builder(itemCount: user_name.length+1,itemBuilder: (context, int index){
        if(index==0){
          return Padding(
            padding: const EdgeInsets.only(left: 0),
            child: Padding(
              padding: const EdgeInsets.only(left: 10,right: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 40,
                    width: 400,
                    child: TextField(
                      decoration:InputDecoration(
                        label: Text("Search"),
                        prefixIcon: Icon(Icons.search),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        )
                      ) ,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20,bottom: 10),
                    child: CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.black12,
                      child: Icon(Icons.person,color: Colors.white,size: 50,),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Messages",style: TextStyle(fontSize: 18),),
                      Text("Requests",style: TextStyle(color: Colors.blue,fontSize: 18),),
                    ],
                  )
                ],
              ),
            ),
          );
        }else{
          return ListTile(
            leading: profile_pic[index-1]==""?
                CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.black12,
                  child: Icon(Icons.person,color: Colors.white,size: 30,),
                ):
                CircleAvatar(
                  radius: 20,
                  backgroundImage: NetworkImage(profile_pic[index-1]),
                ),
            title: Text(user_name[index-1]),
            subtitle: Row(
              children: [
                Text(message[index-1],style: TextStyle(color: Colors.grey),),
                SizedBox(width: 5,),
                time[index-1]==""?
                Text(""):
                Text(time[index-1],style: TextStyle(color: Colors.grey),),
              ],
            ),
            trailing: Icon(Icons.camera_alt_outlined,color: Colors.grey,size: 20,),
          );
        }
      }),
    );
  }
}
