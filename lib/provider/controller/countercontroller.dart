
import 'package:flutter/material.dart';

class Counter extends ChangeNotifier{
  int count = 0;

  countIncrement(){
    count++;
    notifyListeners();
  }

  countDecrement(){
    count--;
    notifyListeners();
  }
}