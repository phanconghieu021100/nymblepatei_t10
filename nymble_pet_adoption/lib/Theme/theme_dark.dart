import 'package:flutter/material.dart';

ThemeData themedark = ThemeData(
  colorScheme: ColorScheme.fromSeed(
    seedColor: Colors.blueAccent,
    brightness: Brightness.dark,
    primary: Colors.white,
  ),
  textTheme: TextTheme(
    displayMedium: TextStyle(color: Colors.black),
  ),
  useMaterial3: true,
);
