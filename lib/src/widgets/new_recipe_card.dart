import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:recappi/src/models/recipe.dart';

import '../constants.dart';

class NewRecipeCard extends StatelessWidget {
  final Recipe recipe;

  const NewRecipeCard({
    Key? key,
    required this.recipe,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        color: white,
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: SizedBox(
          height: 300,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Flexible(
                  flex: 3,
                  child: RecipeContent(
                    name: recipe.name,
                  )),
              Flexible(
                  flex: 2,
                  child: RecipeImage(
                    imageUrl: recipe.photo,
                  )),
            ],
          ),
        ));
  }
}

class RecipeImage extends StatelessWidget {
  final String imageUrl;
  const RecipeImage({
    Key? key,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12.0),
          child: CachedNetworkImage(
            imageUrl: imageUrl,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

class RecipeContent extends StatelessWidget {
  final String name;
  const RecipeContent({
    Key? key,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [Text(name)],
    );
  }
}
