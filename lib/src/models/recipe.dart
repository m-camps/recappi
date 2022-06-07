import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:recappi/src/constants.dart';
import 'package:recappi/src/manager/storage_manager.dart';

class Recipe {
  final String authorUid;
  final List<String> ingredientList;
  final List<String> instructionList;
  final String name;
  final String photo;
  final Timestamp timeCreation;
  final Timestamp timeEdit;
  final Map<String, int> tags;

  Recipe({
    required this.authorUid,
    required this.ingredientList,
    required this.instructionList,
    required this.name,
    required this.photo,
    required this.timeCreation,
    required this.timeEdit,
    required this.tags,
  });

  Map<String, dynamic> toMap() {
    return {
      'authorUid': authorUid,
      'ingredientList': ingredientList,
      'instructionList': instructionList,
      'name': name,
      'photo': photo,
      'timeCreation': timeCreation,
      'timeEdit': timeEdit,
      'tags': tags,
    };
  }

  factory Recipe.fromMap(Map<String, dynamic> map) {
    return Recipe(
      authorUid: map['authorUid'],
      ingredientList: List<String>.from(map['ingredientList']),
      instructionList: List<String>.from(map['instructionList']),
      name: map['name'],
      photo: map['photo'],
      timeCreation: map['timeCreation'],
      timeEdit: map['timeEdit'],
      tags: Map<String, int>.from(map['tags']),
    );
  }

  // factory Recipe.fromFirestore(DocumentSnapshot doc) {
  //   var data = doc.data;
  //   return Recipe(
  //     authorUid: data['authorUid'],
  //     ingredientList: List<String>.from(data['ingredientList']),
  //     instructionList: List<String>.from(map['instructionList']),
  //     name: map['name'],
  //     photo: map['photo'],
  //     timeCreation: map['timeCreation'],
  //     timeEdit: map['timeEdit'],
  //     tags: map['tags'],
  //   );
  // }
}

getDummyRecipe() async {
  final photo = await StorageManager().getImageUrl("/recipe_4.jpg");
  return Recipe(
    authorUid: auth.getUid(),
    ingredientList: [
      '500gr. Spaghetti',
      '300gr. Spekjes',
      '300gr. Parmezaanse Kaas',
      '6 eieren (4 ei dooiers, 2 hele eieren)',
      '400gr. Champignon',
      '150ml. Melk',
      'Italiaanse Kruiden',
      '6 tenen knoflook',
    ],
    instructionList: [
      "Zet water op voor spaghetti en kook volgens de verpakking.",
      "Bak de spekjes. Snijd de knoflook en voeg na circa 10 min aan de spekjes.",
      "Bak in de tussentijd de champignons op laag vuur.",
      "Voeg de eieren toe aan een kom en kluts ze met een vork. Breng op smaak met peper en zout en de italiaanse kruiden. Voeg de melk en 250 gr. kaas toe als je spaghetti bijna klaar is.",
      "Giet de spaghetti af. Voeg de spekjes en de knoflook toe aan de pan met spaghetti. Voeg het ei mengsel toe en begin te roeren terwijl de pan op laag vuur staat.",
      "Serveer zsm en besprenkel met de resterende kaas."
    ],
    name: "Grilled Zucchini and Yellow Squash with Champagne Vinaigrette",
    photo: photo,
    timeCreation: Timestamp.now(),
    timeEdit: Timestamp.now(),
    tags: {
      'Moeilijk': 0xFF467599,
      'Hoofdgerecht': 0xFFD5320B,
      'Vega': 0xFF659157,
      'Very Spicy': 0xFF94251E,
    },
  );
}

fillFireStore() async {
  CollectionReference reciperef =
      FirebaseFirestore.instance.collection('publicRecipes');
  final Recipe recipe = await getDummyRecipe();
  reciperef
      .add(recipe.toMap())
      .then((value) => log("Added Data with ID: $value"));
}
