import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MyWebResultClass extends StatefulWidget {
  final url;

  const MyWebResultClass({Key? key, this.url}) : super(key: key);

  @override
  State<MyWebResultClass> createState() => _MyWebResultClassState(this.url);
}

class _MyWebResultClassState extends State<MyWebResultClass> {
  late WebViewController cntrl;
  var url;

  _MyWebResultClassState(this.url);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cntrl = WebViewController();
    cntrl.setJavaScriptMode(JavaScriptMode.unrestricted);
    cntrl.loadRequest(Uri.parse(this.url));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WebViewWidget(controller: cntrl),
    );
  }
}
