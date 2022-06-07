import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../models/recipe.dart';
import '../widgets/new_recipe_card.dart';

// class MyFriends extends StatelessWidget {
//   const MyFriends({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     getRecipeList();
//     return FutureBuilder(
//       builder: (context, snapshot) {
//         if (!snapshot.hasData) {
//           return const Center(child: CircularProgressIndicator());
//         } else {
//           return ListView.builder(
//             itemCount: 10,
//             itemBuilder: (BuildContext context, int index) {
//               return NewRecipeCard(recipe: snapshot.data as Recipe);
//             },
//           );
//         }
//       },
//       future: getDummyRecipe(),
//     );
//   }
// }

class MyFriends extends StatelessWidget {
  const MyFriends({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        } else {
          List<Recipe> list = snapshot.data as List<Recipe>;
          return ListView.builder(
            itemCount: list.length,
            itemBuilder: (BuildContext context, int index) {
              return NewRecipeCard(recipe: list[index]);
            },
          );
        }
      },
      future: getRecipeList(),
    );
  }
}

getRecipeList() async {
  final recipes = FirebaseFirestore.instance
      .collection('publicRecipes')
      .orderBy("timeCreation");

  List<Recipe> list = [];
  await recipes.get().then(
    (QuerySnapshot querySnapshot) {
      for (var doc in querySnapshot.docs) {
        final data = doc.data() as Map<String, dynamic>;
        list.add(Recipe.fromMap(data));
      }
    },
    onError: (e) => log("Error"),
  );
  return list;
}
