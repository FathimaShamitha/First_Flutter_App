import 'package:flutter/material.dart';
import 'package:myapplication/provider/view/second.dart';
import 'package:provider/provider.dart';

import '../controller/countercontroller.dart';

class MyHomeProvider extends StatelessWidget {
  const MyHomeProvider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final countObject = Provider.of<Counter>(context, listen: false);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          countObject.countIncrement();
        },
        child: Icon(Icons.add),
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
                          builder: (context) => MySecondProvider()));
                },
                child: Text("Next"))
          ],
        ),
      ),
    );
  }
}
