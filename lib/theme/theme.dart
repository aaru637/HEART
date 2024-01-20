import 'package:flutter/material.dart';
import 'package:heart/theme/custom_themes/bottom_navigation_theme.dart';
import 'package:heart/theme/custom_themes/button_theme.dart';
import 'package:heart/theme/custom_themes/icon_theme.dart';
import 'custom_themes/text_theme.dart';

class AppTheme {
  AppTheme._();

  static ThemeData light = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.white,
    elevatedButtonTheme: AppButtonTheme.light,
    iconTheme: AppIconTheme.light,
    textTheme: AppTextTheme.light,
    bottomNavigationBarTheme: AppBottomNavigationTheme.light,
    cardColor: Colors.black,
    canvasColor: Colors.white,
  );

  static ThemeData dark = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.black,
    elevatedButtonTheme: AppButtonTheme.dark,
    iconTheme: AppIconTheme.dark,
    textTheme: AppTextTheme.dark,
    bottomNavigationBarTheme: AppBottomNavigationTheme.dark,
    cardColor: Colors.white,
    canvasColor: Colors.black,
  );

  static Brightness getCurrentTheme(BuildContext context) {
    return MediaQuery.of(context).platformBrightness;
  }
}
