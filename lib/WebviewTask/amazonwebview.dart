import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MyAmazonClass extends StatefulWidget {
  const MyAmazonClass({Key? key}) : super(key: key);

  @override
  State<MyAmazonClass> createState() => _MyAmazonClassState();
}

class _MyAmazonClassState extends State<MyAmazonClass> {
  
  late WebViewController cntrl;
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cntrl = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..loadRequest(Uri.parse("https://www.amazon.com/"));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WebViewWidget(controller: cntrl),
    );
  }
}
