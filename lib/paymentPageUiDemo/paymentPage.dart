import 'package:flutter/material.dart';
import 'package:myapplication/paymentPageUiDemo/paymentSucesspage.dart';

import 'timeoutpage.dart';

class MyPaymentclass extends StatefulWidget {
  const MyPaymentclass({Key? key}) : super(key: key);

  @override
  State<MyPaymentclass> createState() => _MyPaymentclassState();
}

class _MyPaymentclassState extends State<MyPaymentclass> {
  int count = 30;
  bool isClicked = false;
  GlobalKey<FormState> form_key = GlobalKey();
  TextEditingController tcCard_num = TextEditingController();
  TextEditingController tcCard_name = TextEditingController();
  TextEditingController tcCard_month = TextEditingController();
  TextEditingController tcCard_year = TextEditingController();
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
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => MyTimeOutClass()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: form_key,
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              SizedBox(
                height: 200,
                child: Stack(
                  children: [
                    Container(
                      height: 200,
                      width: 400,
                      child: Image.network(
                        "https://www.visa.ca/dam/VCOM/regional/na/canada/pay-with-visa/cards/credit/visa-platinum-recto-800x450.jpg",
                      ),
                    ),
                    AnimatedPositioned(
                        child: CircularProgressIndicator(
                          color: Colors.white,
                        ),
                        duration: Duration(seconds: 1),
                        top: isClicked ? 60 : -100,
                        left: 150),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
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
                        borderRadius: BorderRadius.circular(40))),
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
                    labelText: "CARDHOLDER NAME",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40))),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: tcCard_month,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "This Field must not be empty!";
                        }
                      },
                      decoration: InputDecoration(
                          labelText: "MM",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(40))),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: TextFormField(
                      controller: tcCard_year,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "This Field must not be empty!";
                        }
                      },
                      decoration: InputDecoration(
                          labelText: "YY",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(40))),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: TextFormField(
                      controller: tcCard_cvv,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "This Field must not be empty!";
                        }
                      },
                      decoration: InputDecoration(
                          labelText: "CVV",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(40))),
                      obscureText: true,
                      obscuringCharacter: "*",
                      keyboardType: TextInputType.number,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 60,
                    width: 170,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue[900]),
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
                          style: TextStyle(color: Colors.white),
                        )),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    height: 60,
                    width: 170,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue[900]),
                        onPressed: () {
                          setState(() {
                            isClicked = true;
                            tcCard_num.clear();
                            tcCard_name.clear();
                            tcCard_month.clear();
                            tcCard_year.clear();
                            tcCard_cvv.clear();
                            Future.delayed(Duration(seconds: 2), () {
                              setState(() {
                                isClicked = false;
                              });
                            });
                          });
                        },
                        child: Text(
                          "CLEAR",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        )),
                  )
                ],
              ),
              SizedBox(
                height: 50,
              ),
              Center(
                child: Text(
                  "$count",
                  style: TextStyle(fontSize: 40, color: Colors.blue[900]),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
