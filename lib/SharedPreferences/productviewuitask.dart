import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:myapplication/SharedPreferences/reviewresultpage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyProductViewClass extends StatefulWidget {
  const MyProductViewClass({Key? key}) : super(key: key);

  @override
  State<MyProductViewClass> createState() => _MyProductViewClassState();
}

class _MyProductViewClassState extends State<MyProductViewClass> {

  double rate = 0;
  String sel_review = "Good";
  List<String> reviews = [
    "Average",
    "Good",
    "Very Good",
    "Excellent",
    "Poor",
    "Very Bad",
    "Waste of money"
  ];

  String rev="";
  late double _rating;

  Future<void> setData(double rating,review)async{
    SharedPreferences pref = await SharedPreferences.getInstance();
     setState(() {
       pref.setDouble("rating", rating);
       pref.setString("review", review);
       _rating = rating;
       rev = review;
     });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: (Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Text(
              "Product Review",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  color: Colors.grey),
            ),
            SizedBox(
              height: 20,
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
            SizedBox(
              height: 30,
            ),
            RatingBar.builder(
              itemCount: 5,
              initialRating: 0,
              itemPadding: EdgeInsets.only(left: 3),
              itemBuilder: (context, _) {
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
            Padding(
              padding: EdgeInsets.only(
                top: 20,bottom: 20
              ),
              child: Text(
                "How was your experience ",
                style: TextStyle(fontSize: 20, color: Colors.grey),
              ),
            ),
            DropdownButton(
              value: sel_review,
                items: reviews
                    .map((String r) => DropdownMenuItem(
                          child: Text(r,style: TextStyle(fontSize: 15),),
                          value: r,
                        ))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    sel_review = value!;
                  });
                }),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.grey),
                  onPressed: (){
                setData(rate, sel_review);
                Navigator.push(context, MaterialPageRoute(builder: (context)=>MyReviewResultClass()));
              }, child: Text("Submit",style: TextStyle(color: Colors.white),)),
            )
          ],
        )),
      ),
    );
  }
}
