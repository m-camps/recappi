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

  final int amountIngredients;
  final int timeToCook;
  final int difficulty;
  final bool vega;
  final bool vegan;

  Recipe({
    required this.authorUid,
    required this.ingredientList,
    required this.instructionList,
    required this.name,
    required this.photo,
    required this.timeCreation,
    required this.timeEdit,
    required this.amountIngredients,
    required this.timeToCook,
    required this.difficulty,
    required this.vega,
    required this.vegan,
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
      'amountIngredients': amountIngredients,
      'timeToCook': timeToCook,
      'difficulty': difficulty,
      'vega': vega,
      'vegan': vegan,
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
      amountIngredients: map['amountIngredients'],
      timeToCook: map['timeToCook'],
      difficulty: map['difficulty'],
      vega: map['vega'],
      vegan: map['vegan'],
    );
  }
}

getDummyRecipe() async {
  final photo = await StorageManager().getImageUrl("/recipe_5.jpg");
  return Recipe(
    amountIngredients: 2,
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
    name: "Carbonara",
    photo: photo,
    timeCreation: Timestamp.now(),
    timeEdit: Timestamp.now(),
    timeToCook: 90,
    difficulty: 5,
    vega: false,
    vegan: false,
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
