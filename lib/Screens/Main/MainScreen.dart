import 'package:bottom_bar/bottom_bar.dart';
import 'package:heart/Providers/AdminProvider.dart';
import 'package:heart/Screens/Home/Screen/Home.dart';
import 'package:flutter/material.dart';
import 'package:icons_flutter/icons_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  void initState() {
    super.initState();
  }

  dynamic load() {
    return Provider.of<AdminProvider>(context, listen: false).setAdmin();
  }

  final pageController = PageController();
  int currentPage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        children: [
          FutureBuilder(
              future: load(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return LottieBuilder.asset(
                      "assets/animations/Register_Loading.json");
                } else {
                  return const Home();
                }
              }),
          const Center(child: Text("Chat Page")),
          const Center(child: Text("Notofications Page")),
          const Center(child: Text("Settings Page"))
        ],
        onPageChanged: (index) {
          setState(() {
            currentPage = index;
          });
        },
      ),
      bottomNavigationBar: BottomBar(
        backgroundColor: Colors.blue,
        curve: Curves.easeInOutQuad,
        duration: const Duration(milliseconds: 800),
        items: <BottomBarItem>[
          BottomBarItem(
            icon: const Icon(
              Feather.home,
            ),
            activeIconColor: Colors.white,
            title: Container(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.004),
              child: Text(
                "Home",
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: "Mooli",
                    letterSpacing: 1.05,
                    wordSpacing: 1.05,
                    fontWeight: FontWeight.bold,
                    fontSize: MediaQuery.of(context).size.width * 0.035),
              ),
            ),
            activeColor: Colors.white,
          ),
          BottomBarItem(
            icon: const Icon(
              Feather.message_square,
            ),
            activeIconColor: Colors.white,
            title: Container(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.004),
              child: Text(
                "Message",
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: "Mooli",
                    letterSpacing: 1.05,
                    wordSpacing: 1.05,
                    fontWeight: FontWeight.bold,
                    fontSize: MediaQuery.of(context).size.width * 0.035),
              ),
            ),
            activeColor: Colors.white,
          ),
          BottomBarItem(
            icon: const Icon(
              Feather.bell,
            ),
            activeIconColor: Colors.white,
            title: Container(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.004),
              child: Text(
                "Notifications",
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: "Mooli",
                    letterSpacing: 1.05,
                    wordSpacing: 1.05,
                    fontWeight: FontWeight.bold,
                    fontSize: MediaQuery.of(context).size.width * 0.035),
              ),
            ),
            activeColor: Colors.white,
          ),
          BottomBarItem(
            icon: const Icon(
              Feather.settings,
            ),
            activeIconColor: Colors.white,
            title: Container(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.004),
              child: Text(
                "Settings",
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: "Mooli",
                    letterSpacing: 1.05,
                    wordSpacing: 1.05,
                    fontWeight: FontWeight.bold,
                    fontSize: MediaQuery.of(context).size.width * 0.035),
              ),
            ),
            activeColor: Colors.white,
          ),
        ],
        selectedIndex: currentPage,
        onTap: (value) {
          pageController.jumpToPage(value);
          setState(() {
            currentPage = value;
          });
        },
      ),
    );
  }
}
