import 'package:flutter/material.dart';

class MySnackBarClass extends StatefulWidget {
  const MySnackBarClass({Key? key}) : super(key: key);

  @override
  State<MySnackBarClass> createState() => _MySnackBarClassState();
}

class _MySnackBarClassState extends State<MySnackBarClass> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: MySnackBarDemoClass(),
      ),
    );
  }
}

class MySnackBarDemoClass extends StatelessWidget {
  const MySnackBarDemoClass({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(onPressed: () {
        final snackbar = SnackBar(
          content: Text("Snackbar"),
          action: SnackBarAction(
            label: 'Undo',
            onPressed: () {  },
          ),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackbar);
      }
      , child: Text("Show SnackBar"),
      ),
    );
  }
}

