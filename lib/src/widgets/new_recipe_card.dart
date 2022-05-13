import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class NewRecipeCard extends StatelessWidget {
  final String imageUrl;

  const NewRecipeCard({
    Key? key,
    required this.imageUrl,
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
            children: [
              const Flexible(flex: 2, child: RecipeContent()),
              Flexible(
                  flex: 1,
                  child: RecipeImage(
                    imageUrl: imageUrl,
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
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12.0),
        child: CachedNetworkImage(
          imageUrl: imageUrl,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class RecipeContent extends StatelessWidget {
  const RecipeContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [Text("Test")],
    );
  }
}
