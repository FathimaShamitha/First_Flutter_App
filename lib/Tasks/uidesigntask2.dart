import 'package:flutter/material.dart';

class MyUiExampleClass extends StatefulWidget {
  const MyUiExampleClass({Key? key}) : super(key: key);

  @override
  State<MyUiExampleClass> createState() => _MyUiExampleClassState();
}

class _MyUiExampleClassState extends State<MyUiExampleClass> {

  String gender = "";

  @override
  Widget build(BuildContext context) {
    double wth = MediaQuery.of(context).size.width;
    double ht = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Row(
            children: [
              Container(
                height: ht,
                width: wth/4,
                color: Colors.yellow[700],
                child: Column(
                  children: [
                    SizedBox(height: 80,),
                    CircleAvatar(
                      radius: 40,
                    ),
                  ],
                ),
              ),
              Container(
                height: ht,
                width: wth-wth/4,
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: ht-ht/3,
                          width: wth-(wth-wth/4),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 4),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 50,),
                                Text("Name"),
                                SizedBox(height: 40,),
                                Text("Gender"),
                                SizedBox(height: 40,),
                                Text("Date of birth"),
                                SizedBox(height: 40,),
                                Text("Email"),
                                SizedBox(height: 40,),
                                Text("Mobile"),
                                SizedBox(height: 40,),
                                Text("Customer ID"),
                                SizedBox(height: 40,),
                                Text("Membership"),
                                SizedBox(height: 40,),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          height: ht-ht/3,
                          width: wth-(wth-wth/4-(wth-(wth-wth/4))),
                          child: Column(
                            children: [
                              SizedBox(height: 40,),
                              SizedBox(
                                height: 40,
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.blue[100],
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(2),
                                      borderSide: BorderSide.none
                                    )
                                  ),
                                ),
                              ),
                              SizedBox(height: 20,),
                              SizedBox(
                                height: 40,

                                child: Row(
                                  children: [
                                    RadioMenuButton(
                                        value: "Male",
                                        groupValue: gender,
                                        onChanged: (value) {
                                          setState(() {
                                            gender = value!;
                                          });
                                        },
                                        child: Text(
                                          "M",
                                          style: TextStyle(color: Colors.deepPurple[300]),
                                        )),
                                    RadioMenuButton(
                                        value: "Female",
                                        groupValue: gender,
                                        onChanged: (value) {
                                          setState(() {
                                            gender = value!;
                                          });
                                        },
                                        child: Text(
                                          "F",
                                          style: TextStyle(color: Colors.deepPurple[300]),
                                        )),
                                  ],
                                )
                              ),
                              SizedBox(height: 20,),
                              SizedBox(
                                height: 40,
                                child: TextFormField(
                                  decoration: InputDecoration(
                                      filled: true,
                                      fillColor: Colors.blue[100],
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(2),
                                          borderSide: BorderSide.none
                                      )
                                  ),
                                ),
                              ),
                              SizedBox(height: 20,),
                              SizedBox(
                                height: 40,
                                child: TextFormField(
                                  decoration: InputDecoration(
                                      filled: true,
                                      fillColor: Colors.blue[100],
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(2),
                                          borderSide: BorderSide.none
                                      )
                                  ),
                                ),
                              ),
                              SizedBox(height: 20,),
                              SizedBox(
                                height: 40,
                                child: TextFormField(
                                  decoration: InputDecoration(
                                      filled: true,
                                      fillColor: Colors.blue[100],
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(2),
                                          borderSide: BorderSide.none
                                      )
                                  ),
                                ),
                              ),
                              SizedBox(height: 20,),
                              SizedBox(
                                height: 40,
                                child: TextFormField(
                                  decoration: InputDecoration(
                                      filled: true,
                                      fillColor: Colors.blue[100],
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(2),
                                          borderSide: BorderSide.none
                                      )
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
