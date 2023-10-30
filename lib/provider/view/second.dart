import 'package:flutter/material.dart';
import 'package:myapplication/provider/controller/countercontroller.dart';
import 'package:provider/provider.dart';

import 'home.dart';

class MySecondProvider extends StatelessWidget {
  const MySecondProvider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final countObject = Provider.of<Counter>(context, listen: false);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          countObject.countDecrement();
        },
        child: Icon(Icons.remove),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer<Counter>(
              builder: (context, value, child) {
                return Text("${value.count}");
              },
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MyHomeProvider()));
                },
                child: Text("Home"))
          ],
        ),
      ),
    );
  }
}
