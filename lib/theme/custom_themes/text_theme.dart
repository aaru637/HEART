import 'package:flutter/material.dart';

class AppTextTheme {
  static TextTheme light = TextTheme(
    headlineLarge: const TextStyle().copyWith(
      fontFamily: "TiltWarp",
      fontWeight: FontWeight.bold,
      color: Colors.black,
      letterSpacing: 1.0,
    ),

    headlineMedium: const TextStyle().copyWith(
      fontFamily: "Poppins_Regular",
      fontWeight: FontWeight.bold,
      letterSpacing: 1.0,
    ),

    headlineSmall: const TextStyle().copyWith(
      fontFamily: "TiltWarp",
      fontWeight: FontWeight.bold,
      color: Colors.black,
      letterSpacing: 1.0,
    ),

    // Body
    bodyLarge: const TextStyle().copyWith(
      fontFamily: "RobotoSlab_Medium",
      fontWeight: FontWeight.normal,
      color: Colors.black,
      letterSpacing: 1.0,
    ),

    bodyMedium: const TextStyle().copyWith(
      fontFamily: "RobotoSlab_Medium",
      fontWeight: FontWeight.normal,
      color: Colors.black,
      letterSpacing: 1.0,
    ),

    bodySmall: const TextStyle().copyWith(
      fontFamily: "RobotoSlab_Medium",
      fontWeight: FontWeight.normal,
      color: Colors.black,
      letterSpacing: 1.0,
    ),

    // Title
    titleLarge: const TextStyle().copyWith(
      fontFamily: "RobotoSlab_Regular",
      fontWeight: FontWeight.bold,
      color: Colors.black,
      letterSpacing: 1.0,
    ),

    titleMedium: const TextStyle().copyWith(
      fontFamily: "RobotoSlab_Medium",
      fontWeight: FontWeight.bold,
      color: Colors.black,
      letterSpacing: 1.0,
    ),

    // Button
    labelSmall: const TextStyle().copyWith(
      fontFamily: "RobotoSlab_Medium",
      fontWeight: FontWeight.normal,
      color: Colors.white,
      letterSpacing: 1.0,
    ),

    // Input Field Hint
    labelMedium: const TextStyle().copyWith(
      fontFamily: "RobotoSlab_Medium",
      fontWeight: FontWeight.normal,
      color: Colors.grey.shade700,
    ),

    // Input Field Hint
    labelLarge: const TextStyle().copyWith(
      fontFamily: "RobotoSlab_Medium",
      fontWeight: FontWeight.normal,
      color: Colors.black,
      letterSpacing: 1.0,
    ),

    // Logo Text
    displayLarge: const TextStyle().copyWith(
      fontFamily: "Wide_Latin",
      fontWeight: FontWeight.bold,
      color: Colors.black,
      letterSpacing: 1.0,
    ),

    // Profile name
    displayMedium: const TextStyle().copyWith(
      fontFamily: "TiltWarp",
      fontWeight: FontWeight.normal,
      color: Colors.black,
      letterSpacing: 1.0,
    ),

    // Location
    displaySmall: const TextStyle().copyWith(
      fontFamily: "TiltWarp",
      fontWeight: FontWeight.normal,
      color: Colors.black,
      letterSpacing: 1.0,
    ),

    // Content
    titleSmall: const TextStyle().copyWith(
      fontFamily: "Poppins_SemiBold",
      fontWeight: FontWeight.w700,
      color: Colors.black,
      letterSpacing: 1.0,
    ),
  );

  // Dark Theme
  static TextTheme dark = TextTheme(
    headlineLarge: const TextStyle().copyWith(
      fontFamily: "TiltWarp",
      fontWeight: FontWeight.bold,
      color: Colors.white,
      letterSpacing: 1.0,
    ),

    headlineMedium: const TextStyle().copyWith(
      fontFamily: "TiltWarp",
      fontWeight: FontWeight.bold,
      letterSpacing: 1.0,
    ),

    headlineSmall: const TextStyle().copyWith(
      fontFamily: "TiltWarp",
      fontWeight: FontWeight.bold,
      color: Colors.white,
      letterSpacing: 1.0,
    ),

    // Body
    bodyLarge: const TextStyle().copyWith(
      fontFamily: "RobotoSlab_Medium",
      fontWeight: FontWeight.normal,
      color: Colors.white,
      letterSpacing: 1.0,
    ),

    bodyMedium: const TextStyle().copyWith(
      fontFamily: "RobotoSlab_Medium",
      fontWeight: FontWeight.normal,
      color: Colors.white,
      letterSpacing: 1.0,
    ),

    bodySmall: const TextStyle().copyWith(
      fontFamily: "RobotoSlab_Medium",
      fontWeight: FontWeight.normal,
      color: Colors.white,
      letterSpacing: 1.0,
    ),

    // Title
    titleLarge: const TextStyle().copyWith(
      fontFamily: "RobotoSlab_Regular",
      fontWeight: FontWeight.bold,
      color: Colors.white,
      letterSpacing: 1.0,
    ),

    titleMedium: const TextStyle().copyWith(
      fontFamily: "RobotoSlab_Medium",
      fontWeight: FontWeight.bold,
      color: Colors.white,
      letterSpacing: 1.0,
    ),

    // Input Field Hint
    labelMedium: const TextStyle().copyWith(
      fontFamily: "RobotoSlab_Medium",
      fontWeight: FontWeight.normal,
      color: Colors.grey.shade700,
    ),

    // Button
    labelSmall: const TextStyle().copyWith(
      fontFamily: "RobotoSlab_Medium",
      fontWeight: FontWeight.normal,
      color: Colors.black,
      letterSpacing: 1.0,
    ),

    // Logo Text
    displayLarge: const TextStyle().copyWith(
      fontFamily: "Wide_Latin",
      fontWeight: FontWeight.bold,
      color: Colors.white,
      letterSpacing: 1.0,
    ),

    // Profile name
    displayMedium: const TextStyle().copyWith(
      fontFamily: "TiltWarp",
      fontWeight: FontWeight.normal,
      color: Colors.white,
      letterSpacing: 1.0,
    ),

    // Location
    displaySmall: const TextStyle().copyWith(
      fontFamily: "TiltWarp",
      fontWeight: FontWeight.normal,
      color: Colors.white,
      letterSpacing: 1.0,
    ),

    // Content
    titleSmall: const TextStyle().copyWith(
      fontFamily: "Poppins_SemiBold",
      fontWeight: FontWeight.w700,
      color: Colors.white,
      letterSpacing: 1.0,
    ),
  );
}
