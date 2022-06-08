import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:recappi/src/widgets/recipe_builder.dart';

class MyProfile extends StatelessWidget {
  const MyProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("this text"),
        Expanded(
          child: RecipeListQuery(
            query: FirebaseFirestore.instance
                .collection('publicRecipes')
                .orderBy("timeCreation"),
          ),
        ),
      ],
    );
  }
}
