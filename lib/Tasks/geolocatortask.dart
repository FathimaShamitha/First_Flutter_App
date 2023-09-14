import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class MyLoactionClass extends StatefulWidget {
  const MyLoactionClass({Key? key}) : super(key: key);

  @override
  State<MyLoactionClass> createState() => _MyLoactionClassState();
}

class _MyLoactionClassState extends State<MyLoactionClass> {
  
  Position? mypos;
  
  Future<Position> getPosition()async{
    
    LocationPermission perm = await Geolocator.checkPermission();
    if(perm == LocationPermission.denied){
      perm = await Geolocator.requestPermission();
      if(perm == LocationPermission.deniedForever){
        return Future.error("Something went wrong");
      }
    }
    return Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 200,bottom: 2),
              child: ElevatedButton(onPressed: ()async{
                Position newpos = await getPosition();
                setState(() {
                  mypos = newpos;
                });
              }, child: Text("Get Location")),
            ),
            mypos == null ? Center(child: Text("Location not found")) : Center(child: Text("$mypos"))
          ],
        ),
      ),
    );
  }
}
