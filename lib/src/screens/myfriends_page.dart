import 'package:flutter/material.dart';
import 'package:recappi/src/manager/storage_manager.dart';
import 'package:recappi/src/widgets/new_recipe_card.dart';
import 'package:recappi/src/widgets/recipe_card.dart';

// class MyFriends extends StatelessWidget {
//   const MyFriends({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       itemCount: 10,
//       itemBuilder: (BuildContext context, int index) {
//         return const RecipeCard(name: "Vegetarische Curry met groenten");
//       },
//     );
//   }
// }

class MyFriends extends StatelessWidget {
  const MyFriends({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (BuildContext context, int index) {
        return const RecipeCard(name: "Vegetarische Curry met groenten");
      },
    );
  }
}

// class MyFriends extends StatelessWidget {
//   const MyFriends({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       itemCount: 10,
//       itemBuilder: (BuildContext context, int index) {
//         return FutureBuilder(
//           initialData: const CircularProgressIndicator(),
//           builder: (context, snapshot) {
//             final ret = snapshot.data as Widget;
//             return ret;
//           },
//           future: makeRecipeCard(),
//         );
//       },
//     );
//   }
// }

