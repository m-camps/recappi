import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:recappi/src/constants.dart';
import 'package:recappi/src/models/recipe.dart';
import 'package:recappi/src/widgets/recipe_card.dart';

class RecipeListQuery extends StatelessWidget {
  final Query<Map<String, dynamic>> query;
  const RecipeListQuery({Key? key, required this.query}) : super(key: key);

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
              return RecipeCard(recipe: list[index]);
            },
          );
        }
      },
      future: fstore.getRecipeList(query),
    );
  }
}
