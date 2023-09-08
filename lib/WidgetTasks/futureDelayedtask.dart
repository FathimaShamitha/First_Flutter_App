import 'package:flutter/material.dart';
import 'package:myapplication/paymentPageUiDemo/paymentSucesspage.dart';

import '../paymentPageUiDemo/notFoundPage.dart';

class MyFutureDelayedClass extends StatefulWidget {
  const MyFutureDelayedClass({Key? key}) : super(key: key);

  @override
  State<MyFutureDelayedClass> createState() => _MyFutureDelayedClassState();
}

class _MyFutureDelayedClassState extends State<MyFutureDelayedClass> {

  int count = 60;
   // bool isHidden = true;
  bool isClicked = false;
  GlobalKey<FormState> form_key = GlobalKey();
  TextEditingController tcCard_num = TextEditingController();
  TextEditingController tcCard_name = TextEditingController();
  TextEditingController tcCard_exp = TextEditingController();
  TextEditingController tcCard_cvv = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    decCount();
  }

  void decCount() {
    Future.delayed(Duration(seconds: 1), () {
      if (count > 0) {
        setState(() {
          count--;
        });
        decCount();
      } else {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => MyTimeOutClass()));
      }
    });
  }

  // void showPass() {
  //   setState(() {
  //     isHidden = !isHidden;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: form_key,
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 100,
            child: Stack(
              children: [
                Container(
                  height: 90,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.purple[200]),
                  child: Center(
                      child: Text(
                        "Payment Details",
                        style: TextStyle(fontSize: 25, color: Colors.white),
                      )),),
                AnimatedPositioned(child: CircularProgressIndicator(color: Colors.purple[500],),
                    duration: Duration(seconds: 1),
                    top : isClicked ? 60 : -100,
                    left : 150
                ),
              ],
            ),
          ),
          TextFormField(
            controller: tcCard_num,
            keyboardType: TextInputType.number,
            validator: (value) {
              if (value!.isEmpty) {
                return "This Field must not be empty!";
              }
            },
            decoration: InputDecoration(
                labelText: "CARD NUMBER",
                suffixIcon: Icon(
                  Icons.credit_card_outlined,
                  color: Colors.grey,
                ),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30))),
          ),
          SizedBox(
            height: 10,
          ),
          TextFormField(
            controller: tcCard_name,
            validator: (value) {
              if (value!.isEmpty) {
                return "This Field must not be empty!";
              }
            },
            decoration: InputDecoration(
                labelText: "CARD HOLDERS NAME",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30))),
          ),
          SizedBox(
            height: 10,
          ),
          TextFormField(
            controller: tcCard_exp,
            validator: (value) {
              if (value!.isEmpty) {
                return "This Field must not be empty!";
              }
            },
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
                labelText: "EXPIRATION DATE",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30))),
          ),
          SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 10,
          ),
          TextFormField(
            controller: tcCard_cvv,
            validator: (value) {
              if (value!.isEmpty) {
                return "This Field must not be empty!";
              }
            },
            obscureText: true,
            obscuringCharacter: "*",
            keyboardType: TextInputType.number,
            maxLength: 3,
            decoration: InputDecoration(
               /* suffix: InkWell(
                  onTap: () {
                    setState(() {
                      isHidden = !isHidden;
                    });
                  },
                  child: isHidden
                      ? Icon(
                          Icons.visibility_off,
                          color: Colors.grey,
                        )
                      : Icon(
                          Icons.visibility,
                          color: Colors.grey,
                        ),
                ),*/
              suffixIcon: Icon(Icons.credit_card_sharp,color: Colors.grey,),
                labelText: "CVV",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30))),
          ),
          SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () {
                      if (form_key.currentState!.validate()) {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MySuccessPayClass()));
                      }
                    },
                    child: Text(
                      "PAY NOW",
                      style: TextStyle(color: Colors.purple[200]),
                    )),
                SizedBox(
                  width: 10,
                ),
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        isClicked = true;
                        tcCard_num.clear();
                        tcCard_name.clear();
                        tcCard_exp.clear();
                        tcCard_cvv.clear();
                        Future.delayed(Duration(seconds: 3),(){
                          setState(() {
                            isClicked = false;
                          });
                        });
                      });
                    },
                    child: Text("CLEAR",style: TextStyle(color: Colors.purple[200]),))
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Center(
            child: Text(
              "$count",
              style: TextStyle(fontSize: 25),
            ),
          )
        ],
          ),
        ),
      ),
    );
  }
}
