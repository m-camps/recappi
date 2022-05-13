import 'package:flutter/material.dart';
import 'package:recappi/src/constants.dart';
import 'package:recappi/src/widgets/sign_out_button.dart';

import 'package:recappi/src/screens/discover_page.dart';
import 'package:recappi/src/screens/myfriends_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: const [
          SignOutUser(),
        ],
        title: const LogoAppBarHome(),
      ),
      body: const RepaintBoundary(child: BottomNavBar()),
      backgroundColor: whiteBG,
    );
  }
}

class LogoAppBarHome extends StatelessWidget {
  const LogoAppBarHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      "assets/images/logo_recappi.png",
      color: white,
      height: 40,
    );
  }
}

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _index = 0;
  final List<Widget> _bottomNavPages = const [
    MyFriends(),
    Discover(),
    Text('My Profile')
  ];

  void _changeIndex(int index) {
    setState(() {
      _index = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _bottomNavPages.elementAt(_index),
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 30,
        unselectedItemColor: unselected,
        selectedFontSize: 12.0,
        unselectedFontSize: 12.0,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w600),
        unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.w400),
        items: [
          item("Home", const Icon(Icons.home)),
          item("Friends", const Icon(Icons.supervisor_account)),
          item("My Profile", const Icon(Icons.account_box)),
        ],
        currentIndex: _index,
        onTap: _changeIndex,
      ),
    );
  }

  BottomNavigationBarItem item(String label, Icon icon) {
    return BottomNavigationBarItem(
      icon: icon,
      label: label,
    );
  }
}
