import 'package:get/get.dart';
import 'package:heart/Providers/AdminProvider.dart';
import 'package:heart/Screens/Login/Screen/Login.dart';
import 'package:heart/Screens/Main/MainScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:heart/SharedPreferences/AdminSharedPreferences.dart';
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
        ChangeNotifierProvider(create: (_) => AdminProvider()),
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.green),
        home: const Splash(),
      ),
    );
  }
}

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  void check() async {
    String id = await AdminSharedPreferences.getAdminId();
    if (id != "null") {
      store();
      Get.off(() => const MainScreen());
    } else {
      Get.off(() => const Login());
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    check();
  }

  store() {
    Provider.of<AdminProvider>(context, listen: false).setId();
  }

  @override
  Widget build(BuildContext context) {
    return LottieBuilder.asset("assets/animations/Register_Loading.json");
  }
}
