import 'package:flutter/material.dart';
import 'recappi.dart';
import 'profile.dart';
import 'recipe_list.dart';
import 'single_recipe.dart';
import 'data.dart';

const TextStyle greyicon = TextStyle(
  fontWeight: FontWeight.w600,
  color: greyColor,
);

const TextStyle headerStyle = TextStyle(
  fontSize: 16.0,
  fontWeight: FontWeight.w500,
);

const greyColor = Color.fromARGB(255, 106, 103, 103);
const red = Color.fromARGB(255, 213, 50, 22);
const white = Color.fromARGB(255, 255, 255, 255);
const backgroundRed = Color.fromARGB(255, 250, 239, 236);

const List<Color> gradient = <Color>[
  Color.fromARGB(0, 0, 0, 0),
  Color.fromARGB(100, 0, 0, 0)
];

const List<String> carbonara = <String>[
  '500gr. Spaghetti',
  '300gr. Spekjes',
  '300gr. Parmezaanse Kaas',
  '6 eieren (4 ei dooiers, 2 hele eieren)',
  '400gr. Champignon',
  '150ml. Melk',
  'Italiaanse Kruiden',
  '6 tenen knoflook',
];

const List<String> instructions = <String>[
  "1. Zet water op voor spaghetti en kook volgens de verpakking.",
  "2. Bak de spekjes. Snijd de knoflook en voeg na circa 10 min aan de spekjes.",
  "3. Bak in de tussentijd de champignons op laag vuur.",
  "4. Voeg de eieren toe aan een kom en kluts ze met een vork. Breng op smaak met peper en zout en de italiaanse kruiden. Voeg de melk en 250 gr. kaas toe als je spaghetti bijna klaar is.",
  "5. Giet de spaghetti af. Voeg de spekjes en de knoflook toe aan de pan met spaghetti. Voeg het ei mengsel toe en begin te roeren terwijl de pan op laag vuur staat.",
  "6. Serveer zsm en besprenkel met de resterende kaas."
];

const List<String> names = <String>[
  'Danika Gregory',
  'Eva Arroyo',
  'Zahid Ferrell',
  'Shahid Beltran',
  'Viktoria Weeks',
  'Mila-Rose Braun',
  'Nathanael Pickett',
  'Emyr Oliver',
  'Andre Lugo',
  'Kiara Shelton'
];

const List<String> quote = <String>[
  'I like food',
  'Eat good feel good',
  'My body is a temple',
  'You are what you eat',
  'Foodie'
];

const List<String> recipeNames = <String>[
  'Stoofvlees',
  'Vegan rendang',
  'Spicy fallafel',
  'Spinach risotto',
  'Burrito\'s',
  'Taco\'s'
];

const List<String> portraits = <String>[
  'assets/images/portrait_1.jpg',
  'assets/images/portrait_2.jpg',
  'assets/images/portrait_3.jpg',
  'assets/images/portrait_4.jpg',
  'assets/images/portrait_5.jpg',
  'assets/images/portrait_6.jpg',
];

const List<String> recipePhotos = <String>[
  'assets/images/recipe_1.jpg',
  'assets/images/recipe_2.jpg',
  'assets/images/recipe_3.jpg',
  'assets/images/recipe_4.jpg',
  'assets/images/recipe_5.jpg',
  'assets/images/recipe_6.jpg',
];

const List<int> time = <int>[10, 20, 30, 40];

final List<Recipe> recipeList = makeRecipeList();

Map<String, Widget Function(BuildContext)> routes =
    <String, Widget Function(BuildContext)>{
  // '/': (context) => const MyApp(),
  '/bookmark': (context) => const Recappi2021(),
  '/singlerecipe': (context) => const SingleRecipe(),
  '/profile': (context) => const Profile(),
};

const String lorum =
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras cursus est eu sem volutpat dignissim. Sed congue, nibh in mattis dignissim, diam ipsum bibendum sem, cursus commodo dui quam sagittis mauris. Duis consequat condimentum vehicula. Aliquam at elit ligula. Ut consequat pharetra orci ut mollis. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Integer porta accumsan massa, nec tincidunt est rutrum ac. Nam consequat dictum elit, et laoreet nunc lobortis porta. Etiam rutrum tristique nisl id interdum. Ut in mi at sem lacinia dapibus in vitae tellus. Cras id lacinia orci. Duis feugiat interdum lorem, ut rutrum diam volutpat et.";
