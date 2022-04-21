import 'package:flutter/material.dart';
import '../src/storage_util.dart';
import 'recipe_list.dart';
import 'style.dart';
import 'data.dart';

class SingleRecipe extends StatefulWidget {
  const SingleRecipe({Key? key}) : super(key: key);

  @override
  _SingleRecipeState createState() => _SingleRecipeState();
}

class _SingleRecipeState extends State<SingleRecipe> {
  Map<String, bool> checkbox = {
    'hello': false,
    'hey': false,
  };

  @override
  Widget build(BuildContext context) {
    final recipe = ModalRoute.of(context)!.settings.arguments as Recipe;
    return Scaffold(
      backgroundColor: backgroundRed,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            elevation: 20.0,
            backgroundColor: red,
            floating: false,
            pinned: false,
            snap: false,
            expandedHeight: 200.0,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(recipe.name),
              background: Stack(
                children: [
                  Hero(
                    tag: recipe.index,
                    child: FutureBuilder(
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) {
                          return Container();
                        }
                        return Image.network(
                          snapshot.data.toString(),
                          height: 300.0,
                          width: 1000.0,
                          fit: BoxFit.cover,
                        );
                      },
                      future: recipe.photo,
                    ),
                  ),
                  Container(
                    width: 1000.0,
                    height: 300.0,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: gradient),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
                height: 60.0,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView(
                    children: [
                      Card(
                        child: GreyIcons(
                            Icons.timer, recipe.time.toString() + ' min'),
                      ),
                      Card(
                        child: GreyIcons(Icons.local_fire_department,
                            recipe.kcal.toString() + ' kcal'),
                      ),
                      Card(
                        child: GreyIcons(Icons.list,
                            recipe.ingredients.toString() + ' ingredients'),
                      ),
                    ],
                    scrollDirection: Axis.horizontal,
                  ),
                )),
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
                        children: makeTextBox(recipe.ingredientlist),
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
                        children: makeTextBox(recipe.instructions),
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
            fontSize: 16.0,
            fontWeight: FontWeight.w500,
          ),
        ),
      ));
    }
    return ret;
  }
}
