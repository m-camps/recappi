import 'package:flutter/material.dart';
import 'recipe_list.dart';
import 'style.dart';
import 'add_recipe.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const Recappi2021());
}

class Recappi2021 extends StatefulWidget {
  const Recappi2021({Key? key}) : super(key: key);

  @override
  State<Recappi2021> createState() => _MyAppState();
}

class _MyAppState extends State<Recappi2021> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> bottomNavPages = [
      ListView(shrinkWrap: true, children: buildAllRecipes(recipeList)),
      const Center(child: RecipeForm()),
      ListView(shrinkWrap: true, children: buildBookmarks(recipeList))
    ];
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: red,
          title: Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Image.asset(
              'assets/images/logo_recappi.png',
              color: white,
              height: 40.0,
            ),
          ),
        ),
        body: Scaffold(
          appBar: AppBar(
            backgroundColor: white,
            flexibleSpace: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: const [
                TabBar(
                  labelStyle: TextStyle(fontWeight: FontWeight.w800),
                  labelColor: red,
                  unselectedLabelColor: greyColor,
                  indicatorColor: red,
                  tabs: [
                    Tab(text: 'My friends'),
                    Tab(text: 'Discover'),
                  ],
                )
              ],
            ),
          ),
          body: bottomNavPages.elementAt(_selectedIndex),
          backgroundColor: backgroundRed,
        ),
        bottomNavigationBar: bottomNav(),
      ),
    );
    // );
  }

  Widget bottomNav() {
    return BottomNavigationBar(
      fixedColor: red,
      items: const [
        BottomNavigationBarItem(
          label: "Home",
          icon: Icon(Icons.home),
        ),
        BottomNavigationBarItem(
          label: "Add",
          icon: Icon(Icons.add_box),
        ),
        BottomNavigationBarItem(
          label: "My Recipes",
          icon: Icon(Icons.menu_book_rounded),
        ),
      ],
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,
    );
  }
}
