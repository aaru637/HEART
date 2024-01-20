import 'package:flutter/material.dart';

class AppBottomNavigationTheme {
  AppBottomNavigationTheme._();

  static BottomNavigationBarThemeData light = const BottomNavigationBarThemeData(
    backgroundColor: Colors.white,
    elevation: 0,
    selectedItemColor: Colors.black,
    unselectedItemColor: Colors.black,
    type: BottomNavigationBarType.fixed,
  );

  static BottomNavigationBarThemeData dark = const BottomNavigationBarThemeData(
    backgroundColor: Colors.black,
    elevation: 0,
    selectedItemColor: Colors.white,
    unselectedItemColor: Colors.white,
    type: BottomNavigationBarType.fixed,
  );
}