import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heart/navigation_bar/navigation.dart';
import 'package:heart/on_boarding/screens/on_boarding.dart';
import 'package:heart/providers/dimension_provider/dimension_provider.dart';
import 'package:heart/providers/image_post_card_provider/image_post_card_icon_provider.dart';
import 'package:heart/providers/text_style_provider/home_text_style_provider/home_text_style_provider.dart';
import 'package:heart/providers/text_style_provider/login_text_style_provider/login_text_style_provider.dart';
import 'package:heart/providers/text_style_provider/on_boarding_text_style_provider/on_boarding_text_style_provider.dart';
import 'package:heart/providers/text_style_provider/sign_up_text_style_provider/sign_up_text_style_provider.dart';
import 'package:heart/theme/theme.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ImagePostCardIconProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => DimensionProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => OnBoardingTextStyleProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => LoginTextStyleProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => SignUpTextStyleProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => HomeTextStyleProvider(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      home: const OnBoardingScreen(),
    );
  }
}

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    final styles =
        Provider.of<OnBoardingTextStyleProvider>(context, listen: true);
    return Scaffold(
      body: Center(
        child: Text(
          "Dhineshkumar",
          style: Theme.of(context)
              .textTheme
              .headlineLarge!
              .copyWith(fontSize: styles.titleFontSize),
        ),
      ),
    );
  }
}
