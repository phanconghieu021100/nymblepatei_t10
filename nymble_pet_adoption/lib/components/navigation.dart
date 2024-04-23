import 'package:flutter/material.dart';
import 'package:nymble_pet_adoption/screens/favorate.dart';
import 'package:nymble_pet_adoption/screens/history.dart';
import 'package:nymble_pet_adoption/screens/home.dart';
import 'package:nymble_pet_adoption/screens/profile.dart';

class Navigation extends StatefulWidget {
  const Navigation({super.key});

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int selectedIndex = 0;

  List<Widget> pages = <Widget>[
    const HomePage(),
    const Favorite(),
    const History(),
    const Profile(),
  ];
  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: pages[selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: const Color(0xFFF2968F),
          showUnselectedLabels: false,
          showSelectedLabels: false,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Image.asset(
                  "assets/iconHome.png",
                  height: 30,
                  color: selectedIndex == 0 ? const Color(0xFFF2968F) : null,
                ),
                label: ''),
            BottomNavigationBarItem(
                icon: Image.asset(
                  "assets/iconFavorite.png",
                  height: 30,
                  color: selectedIndex == 1 ? const Color(0xFFF2968F) : null,
                ),
                label: ''),
            BottomNavigationBarItem(
                // icon: Image.asset(
                //   "assets/iconUser.png",
                //   height: 30,
                //   color: selectedIndex == 3 ? const Color(0xFFF2968F) : null,
                // ),
                icon: Icon(
                  Icons.history,
                  size: 30,
                  color: selectedIndex == 2
                      ? const Color(0xFFF2968F)
                      : const Color(0xFFACACAC),
                ),
                label: ''),
            BottomNavigationBarItem(
                icon: Image.asset(
                  "assets/iconUser.png",
                  height: 30,
                  color: selectedIndex == 3 ? const Color(0xFFF2968F) : null,
                ),
                label: ''),
          ],
          currentIndex: selectedIndex,
          onTap: onItemTapped,
        ));
  }
}
