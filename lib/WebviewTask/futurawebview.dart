import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MyFuturaClass extends StatefulWidget {
  const MyFuturaClass({Key? key}) : super(key: key);

  @override
  State<MyFuturaClass> createState() => _MyFuturaClassState();
}

class _MyFuturaClassState extends State<MyFuturaClass> {

  late WebViewController cntrl;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cntrl = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..loadRequest(Uri.parse("https://thefuturalabs.com/"));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WebViewWidget(controller: cntrl,),
    );
  }
}
