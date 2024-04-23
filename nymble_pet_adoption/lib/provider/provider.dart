import 'package:flutter/material.dart';

class ThemeControl extends ChangeNotifier {
  bool _value = true;
  bool get value => _value;

  themeValue() {
    _value = !(_value);
    notifyListeners();
  }
}
