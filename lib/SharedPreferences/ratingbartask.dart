import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class MyRatingbarClass extends StatefulWidget {
  const MyRatingbarClass({Key? key}) : super(key: key);

  @override
  State<MyRatingbarClass> createState() => _MyRatingbarClassState();
}

class _MyRatingbarClassState extends State<MyRatingbarClass> {
  double rate = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Column(
      children: [
        RatingBar.builder(
          itemCount: 5,
          initialRating: 0,
          allowHalfRating: true,
          direction: Axis.horizontal,
          itemPadding: EdgeInsets.all(2),
          itemBuilder: (BuildContext context, int index) {
            return Icon(
              Icons.star,
              color: Colors.amber,
            );
          },
          onRatingUpdate: (rating) {
            setState(() {
              rate = rating;
            });
          },
        ),
        Text("$rate")
      ],
    )));
  }
}
