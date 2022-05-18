import 'package:flutter/material.dart';
import 'package:recappi/src/models/recipe.dart';
import 'package:recappi/src/widgets/new_recipe_card.dart';

class MyProfile extends StatelessWidget {
  const MyProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Text("Loading...");
        } else {
          return ListView.builder(
            itemCount: 10,
            itemBuilder: (BuildContext context, int index) {
              return NewRecipeCard(recipe: snapshot.data as Recipe);
            },
          );
        }
      },
      future: getDummyRecipe(),
    );
  }
}
