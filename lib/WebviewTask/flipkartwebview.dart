import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MyFlipkartClass extends StatefulWidget {
  const MyFlipkartClass({Key? key}) : super(key: key);

  @override
  State<MyFlipkartClass> createState() => _MyFlipkartClassState();
}

class _MyFlipkartClassState extends State<MyFlipkartClass> {

  late WebViewController cntrl;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cntrl = WebViewController();
    cntrl.setJavaScriptMode(JavaScriptMode.unrestricted);
    cntrl.loadRequest(Uri.parse("https://www.flipkart.com/"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WebViewWidget(controller: cntrl,),
    );
  }
}
