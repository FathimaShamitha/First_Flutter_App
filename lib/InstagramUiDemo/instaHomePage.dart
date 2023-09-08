import 'package:flutter/material.dart';

import 'instaChatPage.dart';

class MyInstaHomeClass extends StatefulWidget {
  const MyInstaHomeClass({Key? key}) : super(key: key);

  @override
  State<MyInstaHomeClass> createState() => _MyInstaHomeClassState();
}

class _MyInstaHomeClassState extends State<MyInstaHomeClass> {

  List user_name = ["julie","alex__","jennie"];
  List pro_pic = ["https://shorturl.at/anuQV","https://shorturl.at/dsBKL","https://shorturl.at/bcdf9"];
  List posts = ["https://shorturl.at/anuQV","https://shorturl.at/dsBKL","https://shorturl.at/bcdf9"];

  bool isLiked = false;
  bool isSaved = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Instagram",style: TextStyle(fontFamily: "bluevinyl",fontSize: 30),),
        actions: [
          Row(
          children: [
            Icon(Icons.favorite_border),
            SizedBox(width: 15,),
            InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => MyInstaChatClass()));
                  },
                child: Icon(Icons.chat_outlined)),
            SizedBox(width: 25,)
          ],
        )],
      ),
      body: ListView.builder(itemCount: user_name.length+1, itemBuilder: (context, int index){
        if(index == 0){
         return SingleChildScrollView(
           scrollDirection: Axis.horizontal,
           child: Row(
             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
             children: [
               SizedBox(width: 5,),
               Column(
                 children: [
                   Stack(
                     children: [
                       CircleAvatar(
                         radius: 35,
                         backgroundColor: Colors.black12,
                         child: Icon(Icons.person,color: Colors.white,size: 50,),
                       ),
                       Positioned(
                         top: 45,
                         left: 50,
                         child: CircleAvatar(
                           radius: 10,
                           backgroundColor: Colors.blue,
                           child: Icon(Icons.add,color: Colors.white,size: 20,),
                         ),
                       ),
                     ],
                   ),
                   Text("Your story")
                 ],
               ),
               Padding(
                 padding: const EdgeInsets.only(left: 10),
                 child: MyStatusClass(name: "julie", img_link: "https://shorturl.at/anuQV"),
               ),
               Padding(
                 padding: const EdgeInsets.only(left: 10),
                 child: MyStatusClass(name: "alex__", img_link: "https://shorturl.at/dsBKL"),
               ),
               Padding(
                 padding: const EdgeInsets.only(left: 10),
                 child: MyStatusClass(name: "jennie", img_link: "https://shorturl.at/bcdf9"),
               ),
               Padding(
                 padding: const EdgeInsets.only(left: 10),
                 child: MyStatusClass(name: "john", img_link: "https://shorturl.at/iwzKL"),
               ),
               Padding(
                 padding: const EdgeInsets.only(left: 10),
                 child: MyStatusClass(name: "mary__", img_link: "https://shorturl.at/rDO29"),
               ),
               Padding(
                 padding: const EdgeInsets.only(left: 10),
                 child: MyStatusClass(name: "sooya", img_link: "https://shorturl.at/eiuL7"),
               ),
               Padding(
                 padding: const EdgeInsets.only(left: 10),
                 child: MyStatusClass(name: "aliyaa", img_link: "https://shorturl.at/cltY0"),
               ),
             ],
           ),
         );
        }else{
          return Container(
            height: 400,
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                ListTile(
                  leading: CircleAvatar(
                    radius: 15,
                    backgroundImage: NetworkImage(pro_pic[index-1]),
                  ),
                  title: Text(user_name[index-1]),
                ),
                SizedBox(
                  height: 300,
                  width: MediaQuery.of(context).size.width,
                  child: InkWell(
                     onDoubleTap: (){
                       setState(() {
                         isLiked = !isLiked;
                       });
                     },
                      child: Image(image: NetworkImage(posts[index-1]),fit: BoxFit.fitWidth,)),
                ),
                SizedBox(height: 10,),
                Row(
                  children: [
                    SizedBox(width: 10,),
                    InkWell(
                      onTap: (){
                        setState(() {
                          isLiked = !isLiked;
                        });
                      }, child: isLiked == true ? Icon(Icons.favorite,color: Colors.red[800],) : Icon(Icons.favorite_border_outlined,)),
                    SizedBox(width: 10,),
                    Icon(Icons.chat_rounded),
                    SizedBox(width: 10,),
                    Icon(Icons.send),
                    SizedBox(width: 210,),
                    InkWell(
                      onTap: (){
                        setState(() {
                          isSaved = !isSaved;
                        });
                      },
                        child: isSaved == true ? Icon(Icons.bookmark): Icon(Icons.bookmark_outline))
                  ],
                )
              ],
            ),
          );
        }

      }),
    );
  }
}


class MyStatusClass extends StatelessWidget {

  final String name;
  final String img_link;

  const MyStatusClass({Key? key, required this.name, required this.img_link}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 40,
          backgroundImage: NetworkImage(img_link),
        ),
        Text(name),
      ],
    );
  }
}

