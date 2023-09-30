import 'package:flutter/material.dart';

import '../Screen/Admin/AdminLogin.dart';
import '../Screen/Student/StudentLogin.dart';

class LoginContent extends StatefulWidget {
  const LoginContent({super.key});

  @override
  State<LoginContent> createState() => _LoginContentState();
}

class _LoginContentState extends State<LoginContent>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      width: width - width * 0.1,
      height: height - height * 0.40,
      margin: EdgeInsets.only(
          left: width * 0.05, right: width * 0.05, bottom: width * 0.1),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20)),
      child: Column(
        children: [
          Container(
            height: height - height * 0.920,
            margin: EdgeInsets.fromLTRB(
                width * 0.02, width * 0.03, width * 0.02, width * 0.01),
            decoration: BoxDecoration(
              color: const Color.fromRGBO(216, 217, 207, 1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: TabBar(
              indicatorPadding: EdgeInsets.all(width * 0.022),
              labelColor: Colors.white,
              unselectedLabelColor: Colors.black,
              indicatorWeight: 2,
              indicator: BoxDecoration(
                gradient: const LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    Color.fromRGBO(12, 0, 49, 1),
                    Color.fromRGBO(87, 159, 222, 1)
                  ],
                ),
                color: const Color.fromARGB(255, 28, 66, 191),
                borderRadius: BorderRadius.circular(5),
              ),
              tabs: const [
                Tab(text: "Admin"),
                Tab(
                  text: "Student",
                ),
              ],
              controller: tabController,
            ),
          ),
          Expanded(
              child: TabBarView(
            controller: tabController,
            children: const [
              AdminLogin(),
              StudentLogin(),
            ],
          ))
        ],
      ),
    );
  }
}
