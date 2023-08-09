import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class WeatherClass extends StatefulWidget {
  const WeatherClass({Key? key}) : super(key: key);

  @override
  State<WeatherClass> createState() => _WeatherClassState();
}

class _WeatherClassState extends State<WeatherClass> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10,0,10,0),
          child: Column(
            children: [
              Card(
                elevation: 6,
                child: Padding(
                  padding: const EdgeInsets.only(left: 7),
                  child: Container(
                    height: 60,
                    width: 370,
                    child: Row(
                      children: [
                        Icon(
                          Icons.search,
                          size: 30,
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        Text(
                          "Search Location",
                          style: TextStyle(fontSize: 20, color: Colors.grey[600]),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.location_on_outlined,
                    size: 30,
                  ),
                  Text(
                    "New York",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  )
                ],
              ),
              Text(
                "Tue, Mar 2, 2021 5:11 PM",
                style: TextStyle(fontSize: 20, color: Colors.grey[700]),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.cloud_outlined,
                    color: Colors.blue[400],
                    size: 50,
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Text(
                    "-5°C",
                    style: TextStyle(
                      fontSize: 50,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "-4° / -6° Feels like -10°",
                style: TextStyle(fontSize: 17),
              ),
              Text("Few clouds", style: TextStyle(fontSize: 17)),
              SizedBox(
                height: 10,
              ),
              Card(
                elevation: 6,
                child: InkWell(
                  onTap: (){
                    Fluttertoast.showToast(msg: "Page changed",
                        backgroundColor: Colors.red);
                  },
                  child: Container(
                    height: 90,
                    width: 370,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Icon(
                          Icons.water_drop,
                          color: Colors.blue[400],
                          size: 40,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Precipitation",
                              style: TextStyle(fontSize: 16),
                            ),
                            Text(
                              "4%",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        Container(
                            height: 60,
                            child: VerticalDivider(
                              thickness: 3,
                            )),
                        Icon(
                          Icons.light_mode_outlined,
                          color: Colors.blue[400],
                          size: 40,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "UV Index",
                              style: TextStyle(fontSize: 16),
                            ),
                            Text("Medium",
                                style: TextStyle(fontWeight: FontWeight.bold)),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 20, 200, 20),
                child: Text(
                  "Next 3 Hours",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  NewCardClass(
                      time: "18:00",
                      myicon: Icons.cloud_outlined,
                      temp: "-5.7°C"),
                  NewCardClass(
                      time: "19:00",
                      myicon: Icons.light_mode_outlined,
                      temp: "-6.3°C"),
                  NewCardClass(
                      time: "20:00",
                      myicon: Icons.cloud_outlined,
                      temp: "-6.3°C"),
                ],
              )
            ],
          ),
        ),
      ),
    ));
  }
}

class NewCardClass extends StatelessWidget {
  final String time;
  final IconData myicon;
  final String temp;

  const NewCardClass(
      {Key? key, required this.time, required this.myicon, required this.temp})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      child: Container(
        height: 180,
        width: 90,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              time,
              style: TextStyle(fontSize: 20),
            ),
            Icon(
              myicon,
              color: Colors.blue[400],
              size: 40,
            ),
            Text(
              temp,
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
