import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:recappi/src/models/recipe.dart';

class FstoreManager {
  getRecipeList(Query<Map<String, dynamic>> query) async {
    List<Recipe> list = [];

    await query.get().then(
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
}
