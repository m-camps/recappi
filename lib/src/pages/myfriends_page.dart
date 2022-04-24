import 'package:flutter/material.dart';
import 'package:recappi/src/widgets/recipe_card.dart';

class MyFriends extends StatelessWidget {
  const MyFriends({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (BuildContext context, int index) {
        return const ListTile(
          title: RecipeCard(),
        );
      },
    );
  }
}
