import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:recappi/src/widgets/recipe_builder.dart';

class MyFriends extends StatelessWidget {
  const MyFriends({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RecipeListQuery(
      query: FirebaseFirestore.instance
          .collection('publicRecipes')
          .orderBy("name"),
    );
  }
}
