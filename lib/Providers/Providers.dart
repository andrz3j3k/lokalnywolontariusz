import 'package:flutter/material.dart';

class Login extends ChangeNotifier {
  changeText(text) {
    text;
    notifyListeners();
  }
}

class IsTake extends ChangeNotifier {
  String isTake = "";
  changeText(value) {
    isTake = value;
    notifyListeners();
  }
}
