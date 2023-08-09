import 'package:flutter/material.dart';

class MyProfileClass extends StatefulWidget {
  const MyProfileClass({Key? key}) : super(key: key);

  @override
  State<MyProfileClass> createState() => _MyProfileClassState();
}

class _MyProfileClassState extends State<MyProfileClass> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 40,
              ),
              Center(
                child: CircleAvatar(
                  radius: 60,
                  backgroundImage: AssetImage("assets/images/profile_pic.jpg"),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Fathima Shamitha",
                style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Flutter Intern | Daily",
                    style: TextStyle(fontSize: 15, color: Colors.grey[600]),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Icon(
                    Icons.language,
                    color: Colors.blue[100],
                  )
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 70, right: 70),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconClass(myicon: "assets/images/gmail_logo.png"),
                    IconClass(myicon: "assets/images/linked_in_logo.png"),
                    IconClass(myicon: "assets/images/git_logo.png"),
                    IconClass(myicon: "assets/images/insta_logo.jpg"),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "8",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      Text(
                        "Posts",
                        style: TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Msc CS",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      Text(
                        "Qualification",
                        style: TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "23",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      Text(
                        "Age",
                        style: TextStyle(fontSize: 14),
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    height: 50,
                    width: 160,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.blue, width: 2),
                        borderRadius: BorderRadius.circular(6)),
                    child: Center(
                        child: Text(
                          "Message",
                          style: TextStyle(color: Colors.blue, fontSize: 18),
                        )),
                  ),
                  Container(
                    height: 50,
                    width: 160,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(4)),
                    child: Center(
                        child: Text(
                          "Follow",
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        )),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Row(
                  children: [
                    PhotoClass(mypic: "https://rb.gy/x9zou"),
                    PhotoClass(mypic: "https://rb.gy/hlvfv"),
                    PhotoClass(mypic: "https://shorturl.at/agjEW"),
                  ],
                ),
              ),
              SizedBox(
                height: 3,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Row(
                  children: [
                    PhotoClass(mypic: "https://shorturl.at/hjtH3"),
                    PhotoClass(mypic: "https://rb.gy/x9zou"),
                    PhotoClass(mypic: "https://shorturl.at/cBOXY"),
                  ],
                ),
              ),
              SizedBox(
                height: 3,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Row(
                  children: [
                    PhotoClass(mypic: "https://shorturl.at/eoqT9"),
                    PhotoClass(mypic: "https://shorturl.at/gCGN2"),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PhotoClass extends StatelessWidget {
  final String mypic;

  const PhotoClass({Key? key, required this.mypic}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 2),
      child: Container(
        height: 110,
        width: 110,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
        child: Image(
          image: NetworkImage(mypic),
          fit: BoxFit.fitWidth,
        ),
      ),
    );
  }
}

class IconClass extends StatelessWidget {
  final String myicon;

  const IconClass({Key? key, required this.myicon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 40,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.grey[100]),
      child: SizedBox(
        width: 20,
        height: 20,
        child: Image(
          image: AssetImage(myicon),
          fit: BoxFit.fitHeight,
        ),
      ),
    );
  }
}
