import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:recappi/src/constants.dart';
import 'package:recappi/src/models/recipe.dart';
import 'package:recappi/src/widgets/tag_block.dart';

class RecipeHero extends StatelessWidget {
  final Recipe recipe;
  const RecipeHero({Key? key, required this.recipe}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverPhotoAppBar(recipe: recipe),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                recipe.name,
                style: const TextStyle(
                  fontSize: 24.0,
                  color: text,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SliverTagBlock(recipe: recipe),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: makeTextBox(recipe.ingredientList),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: makeTextBox(recipe.instructionList),
                  ),
                ),
              ],
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(height: 200.0),
          ),
        ],
      ),
    );
  }

  List<Widget> makeTextBox(List<String> list) {
    List<Widget> ret = <Widget>[];
    for (var line in list) {
      ret.add(Padding(
        padding: const EdgeInsets.all(5.0),
        child: Text(
          line,
          textAlign: TextAlign.start,
          style: const TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.w500,
          ),
        ),
      ));
    }
    return ret;
  }
}

class SliverPhotoAppBar extends StatelessWidget {
  const SliverPhotoAppBar({
    Key? key,
    required this.recipe,
  }) : super(key: key);

  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      // elevation: 20.0,
      backgroundColor: primaryRed,
      pinned: true,
      expandedHeight: MediaQuery.of(context).size.height * 0.3,
      flexibleSpace: FlexibleSpaceBar(
        background: Hero(
          tag: recipe.timeCreation,
          child: CachedNetworkImage(
            imageUrl: recipe.photo,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

class SliverTagBlock extends StatelessWidget {
  const SliverTagBlock({
    Key? key,
    required this.recipe,
  }) : super(key: key);

  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: TagBlockWrap(
            recipe: recipe,
          ),
        ),
      ),
    );
  }
}
