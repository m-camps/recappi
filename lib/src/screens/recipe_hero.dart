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
          SliverAppBar(
            elevation: 20.0,
            backgroundColor: primaryRed,
            floating: false,
            pinned: false,
            snap: false,
            expandedHeight: 400.0,
            flexibleSpace: FlexibleSpaceBar(
              title: Container(
                decoration: const BoxDecoration(
                  color: primaryRed,
                  borderRadius: BorderRadius.all(
                    Radius.circular(5),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text(recipe.name),
                ),
              ),
              background: Hero(
                tag: recipe.timeCreation,
                child: CachedNetworkImage(
                  imageUrl: recipe.photo,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TagBlockWrap(
                recipe: recipe,
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Card(
                  child: SizedBox(
                    width: 1000,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: makeTextBox(recipe.ingredientList),
                      ),
                    ),
                  ),
                ),
                Card(
                  child: SizedBox(
                    width: 1000,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: makeTextBox(recipe.instructionList),
                      ),
                    ),
                  ),
                ),
              ],
            ),
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
