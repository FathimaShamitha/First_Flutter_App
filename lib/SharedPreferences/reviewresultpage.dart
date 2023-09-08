import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyReviewResultClass extends StatefulWidget {
  const MyReviewResultClass({Key? key}) : super(key: key);

  @override
  State<MyReviewResultClass> createState() => _MyReviewResultClassState();
}

class _MyReviewResultClassState extends State<MyReviewResultClass> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  String review = "";
  late double rating;

  Future<void> getData() async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    setState(() {
      review = pref.getString("review") ?? "";
      rating = pref.getDouble("rating") ?? 1.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 40,
          ),
          Center(
            child: SizedBox(
                height: 200,
                width: 250,
                child: Image(
                  image: NetworkImage("https://shorturl.at/ntSW7"),
                  fit: BoxFit.fitWidth,
                )),
          ),
          RatingBarIndicator(
            itemBuilder: (context, _) {
              return Icon(
                Icons.star,
                color: Colors.amber,
              );
            },
            itemCount: 5,
            itemPadding: EdgeInsets.only(left: 3),
            rating: rating,
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            review,
            style: TextStyle(fontSize: 25, color: Colors.grey),
          )
        ],
      ),
    );
  }
}
