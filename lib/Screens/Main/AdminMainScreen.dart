import 'package:bottom_bar/bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:heart/Screens/Home/Screen/Home.dart';
import 'package:icons_flutter/icons_flutter.dart';

class AdminMainScreen extends StatefulWidget {
  const AdminMainScreen({super.key});

  @override
  State<AdminMainScreen> createState() => _AdminMainScreenState();
}

class _AdminMainScreenState extends State<AdminMainScreen> {
  final pageController = PageController();
  int currentPage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        children: const [
          Home(),
          Center(child: Text("Chat Page")),
          Center(child: Text("Notofications Page")),
          Center(child: Text("Settings Page"))
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
