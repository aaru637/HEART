import 'package:get/get.dart';
import 'package:heart/Providers/AdminProvider.dart';
import 'package:heart/Screens/Login/Screen/Login.dart';
import 'package:heart/Screens/Main/AdminOpeningScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AdminProvider>(
          create: (_) => AdminProvider(),
        ),
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.green),
        home: const Splash(),
      ),
    );
  }
}

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<AdminProvider>(context, listen: false);
    return FutureBuilder(
      future: user.setId(),
      builder: (context, AsyncSnapshot<String?> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Container(
              color: Colors.white,
              child: LottieBuilder.asset("assets/animations/Loading.json"));
        } else {
          return snapshot.data! != "null"
              ? const AdminOpeningScreen()
              : const Login();
        }
      },
    );
  }
}
