import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

class MuCaroselsliderClass extends StatefulWidget {
  const MuCaroselsliderClass({Key? key}) : super(key: key);

  @override
  State<MuCaroselsliderClass> createState() => _MuCaroselsliderClassState();
}

class _MuCaroselsliderClassState extends State<MuCaroselsliderClass> {

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          CarouselSlider(
            options: CarouselOptions(height: 250,onPageChanged: (index, reason){
              setState(() {
                currentIndex = index;
              });
            }),
            items: [1,2,3,4,5].map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: Colors.green
                      ),
                      child: Center(child: Text('text $i', style: TextStyle(fontSize: 16.0),))
                  );
                },
              );
            }).toList(),
          ),
          DotsIndicator(
              dotsCount:5,
              position: currentIndex)
        ],
      ),
    );
  }
}
