import 'package:flutter/material.dart';

class NavigationBarController extends ChangeNotifier {
  int currentIndex = 1;
  double iconSize = 30;

  void setCurrentIndex({required int index}) {
    currentIndex = index;
    notifyListeners();
  }


}
