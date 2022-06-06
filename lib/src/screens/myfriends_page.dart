import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../models/recipe.dart';
import '../widgets/new_recipe_card.dart';

class MyFriends extends StatelessWidget {
  const MyFriends({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    getRecipeList();
    return FutureBuilder(
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
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

getRecipeList() async {
  CollectionReference recipes =
      FirebaseFirestore.instance.collection('publicRecipes');

  Recipe list;
  // recipes.get().then((DocumentSnapshot documentSnapshot) {
  //   if (documentSnapshot.exists) {
  //     print(documentSnapshot);
  //   }
  // });
  print(recipes);
}
