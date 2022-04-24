import 'package:flutter/material.dart';
import 'package:recappi/src/constants.dart';
import 'package:recappi/src/firebase_auth/auth_signout.dart';
import 'package:recappi/src/pages/discover_page.dart';
import 'package:recappi/src/pages/myfriends_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: const [SignOutUser()],
        title: const LogoAppBarHome(),
      ),
      body: const BottomNavBar(),
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

class HomeTabBar extends StatelessWidget with PreferredSizeWidget {
  const HomeTabBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: TabBar(
          labelStyle: TextStyle(fontWeight: FontWeight.w800),
          labelColor: primaryRed,
          unselectedLabelColor: unselected,
          indicatorColor: primaryRed,
          tabs: [
            Tab(text: 'My friends'),
            Tab(text: 'Discover'),
          ],
        ),
        body: HomeTabView(),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class HomeTabView extends StatelessWidget {
  const HomeTabView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const TabBarView(
      children: [
        MyFriends(),
        Discover(),
      ],
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
    HomeTabBar(),
    Text('Add'),
    Text('My Recipes')
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
        fixedColor: primaryRed,
        items: [
          item("Home", const Icon(Icons.home)),
          item("Add", const Icon(Icons.add_box)),
          item("My Recipes", const Icon(Icons.menu_book_rounded)),
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
