import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:recappi/src/models/recipe.dart';
import 'package:recappi/src/screens/recipe_hero.dart';

import '../constants.dart';

class RecipeCard extends StatelessWidget {
  final Recipe recipe;

  const RecipeCard({
    Key? key,
    required this.recipe,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double cardHeight = (MediaQuery.of(context).size.height - 150) / 3;
    return Card(
      color: white,
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => RecipeHero(recipe: recipe),
            ),
          );
        },
        child: SizedBox(
          height: cardHeight,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                  // fit: FlexFit.tight,
                  flex: 3,
                  child: RecipeContent(
                    recipe: recipe,
                  )),
              Flexible(
                  flex: 2,
                  child: RecipeImage(
                    recipe: recipe,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

class RecipeImage extends StatelessWidget {
  final Recipe recipe;
  const RecipeImage({
    Key? key,
    required this.recipe,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12.0),
          child: Hero(
            tag: recipe.timeCreation,
            child: CachedNetworkImage(
              imageUrl: recipe.photo,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}

class RecipeContent extends StatelessWidget {
  final Recipe recipe;
  const RecipeContent({
    Key? key,
    required this.recipe,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RecipeName(recipe: recipe),
              const ProfileCard(),
            ],
          ),
          TagBlockWrap(
            recipe: recipe,
          ),
        ],
      ),
    );
  }
}

class RecipeName extends StatelessWidget {
  final Recipe recipe;
  const RecipeName({
    Key? key,
    required this.recipe,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      recipe.name,
      maxLines: 2,
      style: const TextStyle(
        fontSize: 24,
        color: text,
        overflow: TextOverflow.ellipsis,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

class ProfileCard extends StatelessWidget {
  final String profileName = "Yesse Teitsma";
  const ProfileCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        ClipOval(
          child: CachedNetworkImage(
              placeholder: (context, url) =>
                  const SizedBox(height: 20, width: 20),
              fit: BoxFit.cover,
              height: 20.0,
              memCacheHeight: 20,
              memCacheWidth: 20,
              imageUrl:
                  "https://firebasestorage.googleapis.com/v0/b/recappi-2022.appspot.com/o/profile_images%2Fmax.jpeg?alt=media&token=2556b50e-2903-4393-b1b7-18977ff09fda"),
        ),
        const SizedBox(width: 6),
        Text(
          profileName,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            overflow: TextOverflow.fade,
            color: text,
          ),
        ),
        const SizedBox(width: 6),
      ],
    );
  }
}

class TagBlockWrap extends StatelessWidget {
  final Recipe recipe;
  const TagBlockWrap({
    Key? key,
    required this.recipe,
  }) : super(key: key);

  List<Widget> makeTagBlock() {
    List<Widget> list = [];

    recipe.tags.forEach((key, value) {
      list.add(TagBlock(name: key, color: Color(value)));
    });
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      runSpacing: 5.0,
      spacing: 5.0,
      children: makeTagBlock(),
    );
  }
}

class TagBlock extends StatelessWidget {
  final String name;
  final Color color;

  const TagBlock({
    Key? key,
    required this.name,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: const BorderRadius.all(Radius.circular(3)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(3.0),
        child: Text(
          name,
          style: const TextStyle(
            color: white,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
