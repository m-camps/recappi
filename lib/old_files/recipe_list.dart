import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:recappi/src/firebase_storage/storage_util.dart';
import 'style.dart';
import 'dart:math';
import 'data.dart';
import 'package:flutter/services.dart';
import 'dart:convert';

Recipe makeRecipe() {
  Author author = Author(
    name: names[Random().nextInt(5)],
    quote: quote[Random().nextInt(5)],
    portrait: portraits[Random().nextInt(6)],
  );
  Recipe _recipe = Recipe(
    name: recipeNames[Random().nextInt(5)],
    photo: getImageUrl("recipe_1.jpg"),
    author: author,
    time: time[Random().nextInt(4)],
    kcal: Random().nextInt(300) + 200,
    ingredients: Random().nextInt(15),
    comments: Random().nextInt(15),
    likes: Random().nextInt(10) + 5,
    instructions: instructions,
    ingredientlist: carbonara,
  );
  return (_recipe);
}

void parseDataTextJson() async {
  final String response = await rootBundle.loadString('assets/data.json');
  final List<dynamic> list = json.decode(response);

  for (var x in list) {
    final Recipe recipe = Recipe.fromMap(x);
    recipeList.insert(0, recipe);
  }
}

List<Recipe> makeRecipeList() {
  final List<Recipe> _recipes = <Recipe>[];
  parseDataTextJson();
  for (var i = 0; i < 10; i++) {
    _recipes.add(makeRecipe());
  }
  return _recipes;
}

List<Widget> buildAllRecipes(List<Recipe> _recipeList) {
  final List<Widget> _recipes = <Widget>[];
  int i = 0;

  for (var recipe in _recipeList) {
    _recipes.add(RecipeCardOld(recipe));
    recipe.index = i;
    i++;
  }
  return _recipes;
}

List<Widget> buildBookmarks(List<Recipe> _recipeList) {
  final List<Widget> _recipes = <Widget>[];

  for (var recipe in _recipeList) {
    if (recipe.bookmark) _recipes.add(RecipeCardOld(recipe));
  }
  if (_recipes.isEmpty) {
    _recipes.add(
      const Center(
        child: Padding(
          padding: EdgeInsets.only(top: 200.0),
          child: Text("Bookmark \nrecipes to view them here",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 24.0,
              )),
        ),
      ),
    );
  }
  return _recipes;
}

class RedIcon extends StatefulWidget {
  final IconData fill;
  final IconData empty;
  final int amount;

  const RedIcon(this.fill, this.empty, this.amount, {Key? key})
      : super(key: key);

  @override
  _RedIconState createState() => _RedIconState();
}

class _RedIconState extends State<RedIcon> {
  bool _isFilled = false;
  int amount = 0;

  @override
  void initState() {
    amount = widget.amount;
    super.initState();
  }

  void _fillIcon() {
    setState(() {
      if (amount == -1) amount = widget.amount;
      if (_isFilled) {
        amount--;
      } else {
        amount++;
      }
      _isFilled = !_isFilled;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          IconButton(
            onPressed: () {
              _fillIcon();
            },
            icon: Icon(
              (_isFilled) ? widget.fill : widget.empty,
              color: red,
            ),
          ),
          Text(
            (amount).toString(),
            style: greyicon,
          ),
        ],
      ),
    );
  }
}

class BookmarkRecipe extends StatefulWidget {
  final int index;
  const BookmarkRecipe(this.index, {Key? key}) : super(key: key);

  @override
  _BookmarkRecipeState createState() => _BookmarkRecipeState();
}

class _BookmarkRecipeState extends State<BookmarkRecipe> {
  bool _isFilled = false;

  @override
  void initState() {
    _isFilled = recipeList[widget.index].bookmark;
    super.initState();
  }

  void _fillIcon() {
    setState(() {
      _isFilled = !_isFilled;
      recipeList[widget.index].bookmark = _isFilled;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(1.0),
      child: IconButton(
        splashRadius: 1.0,
        highlightColor: null,
        color: greyColor,
        icon: (_isFilled)
            ? const Icon(Icons.bookmark, color: red)
            : const Icon(Icons.bookmark_border_outlined),
        onPressed: () {
          _fillIcon();
        },
      ),
    );
  }
}

class RecipeCardOld extends StatefulWidget {
  final Recipe recipe;

  const RecipeCardOld(this.recipe, {Key? key}) : super(key: key);

  @override
  _RecipeCardOldState createState() => _RecipeCardOldState();
}

class _RecipeCardOldState extends State<RecipeCardOld> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: Center(
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          elevation: 5.0,
          color: Colors.white,
          child: InkWell(
            onTap: () {
              Navigator.pushNamed(
                context,
                '/singlerecipe',
                arguments: widget.recipe,
              );
            },
            child: SizedBox(
              width: 500.0,
              child: Column(
                children: <Widget>[
                  _buildHeader(widget.recipe),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 24.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          widget.recipe.name,
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 24.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: _icons(widget.recipe),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsetsDirectional.all(20.0),
                          child: Stack(
                            alignment: AlignmentDirectional.bottomEnd,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10.0),
                                child: Hero(
                                  tag: widget.recipe.index,
                                  child: FutureBuilder(
                                    builder: (context, snapshot) {
                                      if (!snapshot.hasData) {
                                        return const CircularProgressIndicator();
                                      }
                                      return CachedNetworkImage(
                                        imageUrl: snapshot.data.toString(),
                                        height: 150.0,
                                        width: 150.0,
                                        fit: BoxFit.cover,
                                      );
                                    },
                                    future: widget.recipe.photo,
                                  ),
                                ),
                              ),
                              BookmarkRecipe(widget.recipe.index),
                            ],
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _icons(Recipe recipe) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(
            left: 10.0,
            top: 10.0,
          ),
          child: Column(
            children: [
              GreyIcons(Icons.timer, recipe.time.toString() + ' min'),
              GreyIcons(Icons.local_fire_department,
                  recipe.kcal.toString() + " kcal"),
              GreyIcons(
                  Icons.list, recipe.ingredients.toString() + " ingredients"),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              RedIcon(
                Icons.favorite,
                Icons.favorite_border_outlined,
                recipe.likes,
              ),
              RedIcon(
                Icons.mode_comment_rounded,
                Icons.mode_comment_outlined,
                recipe.comments,
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildHeader(Recipe recipe) {
    return Card(
      elevation: 0.0,
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(
            context,
            '/profile',
            arguments: widget.recipe,
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Flexible(
                child: ListTile(
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(40.0),
                    child: Image.asset(recipe.author.portrait,
                        width: 50.0, height: 50.0, fit: BoxFit.cover),
                  ),
                  title: Text(recipe.author.name),
                  subtitle: Text(recipe.author.quote),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class GreyIcons extends StatelessWidget {
  final String data;
  final IconData icon;
  const GreyIcons(this.icon, this.data, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(icon, color: greyColor),
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Text(data, style: greyicon),
          ),
        ],
      ),
    );
  }
}
