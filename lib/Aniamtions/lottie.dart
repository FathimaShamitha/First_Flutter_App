import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class MySplshLottieClass extends StatefulWidget {
  const MySplshLottieClass({Key? key}) : super(key: key);

  @override
  State<MySplshLottieClass> createState() => _MySplshLottieClassState();
}

class _MySplshLottieClassState extends State<MySplshLottieClass>
    with TickerProviderStateMixin {
  AnimationController? controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 5),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: 100,
        width: 100,
        child: Lottie.asset("assets/lottie/uploadimage.json",
            controller: controller, onLoaded: (value) {
          controller!.duration = value.duration;
        }),
      ),
    );
  }
}
