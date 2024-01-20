import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:heart/home/screens/home.dart';
import 'package:heart/messages/screens/messages.dart';
import 'package:heart/new_post/screens/new_post.dart';
import 'package:heart/profile/screens/profile.dart';
import 'package:heart/search/screens/search.dart';
import 'package:iconly/iconly.dart';

class Navigation extends StatefulWidget {
  const Navigation({super.key});

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int current = 0;
  final widgets = const <Widget>[
    Home(),
    Search(),
    New_Post(),
    Messages(),
    Profile(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: (index) => setState(
          () {
            current = index;
          },
        ),
        currentIndex: current,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(
            icon: current == 0
                ? const Icon(
                    IconlyBold.home,
                    size: 30,
                  )
                : const Icon(
                    IconlyLight.home,
                    size: 30,
                  ),
            label: ' ',
          ),
          BottomNavigationBarItem(
            icon: current == 1
                ? const Icon(
                    IconlyBold.search,
                    size: 30,
                  )
                : const Icon(
                    EvaIcons.searchOutline,
                    size: 30,
                  ),
            label: ' ',
          ),
          BottomNavigationBarItem(
            icon: current == 2
                ? const Icon(
                    Icons.add_circle_rounded,
                    size: 30,
                  )
                : const Icon(
                    Icons.add_circle_outline_rounded,
                    size: 30,
                  ),
            label: ' ',
          ),
          BottomNavigationBarItem(
            icon: current == 3
                ? const Icon(
                    IconlyBold.message,
                    size: 30,
                  )
                : const Icon(
                    IconlyLight.message,
                    size: 30,
                  ),
            label: ' ',
          ),
          BottomNavigationBarItem(
              icon: current == 4
                  ? Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(
                              width: 3,
                              color: Theme.of(context).iconTheme.color!)),
                      child: const CircleAvatar(
                        radius: 15,
                        backgroundImage: AssetImage("assets/images/BEN.jpg"),
                      ),
                    )
                  : Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(width: 0)),
                      child: const CircleAvatar(
                        radius: 15,
                        backgroundImage: AssetImage("assets/images/BEN.jpg"),
                      ),
                    ),
              label: ' '),
        ],
      ),
      body: SingleChildScrollView(child: widgets[current]),
    );
  }
}
