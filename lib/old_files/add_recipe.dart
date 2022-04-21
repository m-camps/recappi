import 'package:flutter/material.dart';
import 'package:recappi/src/storage_util.dart';
import 'style.dart';
import 'data.dart';
import 'dart:math';

class RecipeForm extends StatefulWidget {
  const RecipeForm({Key? key}) : super(key: key);

  @override
  _RecipeFormState createState() => _RecipeFormState();
}

class _RecipeFormState extends State<RecipeForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final FocusNode instr = FocusNode();
  final FocusNode ingr = FocusNode();
  late Recipe recipe;
  @override
  void initState() {
    recipe = initRecipe();
    super.initState();
  }

  Recipe initRecipe() {
    Author author = Author(
      name: names[Random().nextInt(5)],
      quote: quote[Random().nextInt(5)],
      portrait: portraits[Random().nextInt(6)],
    );
    Recipe _recipe = Recipe(
      name: "",
      photo: getImageUrl("recipe_1.jpg"),
      author: author,
      time: 0,
      kcal: 0,
      ingredients: 0,
      comments: Random().nextInt(15),
      likes: Random().nextInt(15),
      instructions: [],
      ingredientlist: [],
      index: Random().nextInt(200),
    );
    return _recipe;
  }

  Widget buildList(List<String> list, String header, FocusNode focus) {
    TextEditingController _tec = TextEditingController();
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: (Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              header,
              style: headerStyle,
            ),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: list.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(list[index]),
                );
              },
            ),
            TextFormField(
              focusNode: focus,
              decoration: InputDecoration(
                  hintText: "Add " + header,
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () {
                      setState(() {
                        _tec.clear();
                      });
                    },
                  )),
              controller: _tec,
              onFieldSubmitted: (value) {
                setState(() {
                  if (header == "Instructions") {
                    list.add((list.length + 1).toString() + ". " + _tec.text);
                  } else {
                    list.add("- " + _tec.text);
                  }
                  FocusScope.of(context).requestFocus(focus);
                });
              },
            )
          ],
        )),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: (Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Recipe", style: headerStyle),
                      TextFormField(
                        textInputAction: TextInputAction.next,
                        onSaved: (name) {
                          recipe.name = name as String;
                        },
                        autofocus: true,
                        decoration: const InputDecoration(
                          hintText: "Recipe Name",
                        ),
                      ),
                      TextFormField(
                        textInputAction: TextInputAction.next,
                        onSaved: (name) {
                          recipe.time = int.parse(name as String);
                        },
                        autofocus: true,
                        decoration: const InputDecoration(
                          hintText: "Time in minutes",
                        ),
                      ),
                      TextFormField(
                        textInputAction: TextInputAction.next,
                        onSaved: (name) {
                          recipe.kcal = int.parse(name as String);
                        },
                        autofocus: true,
                        decoration: const InputDecoration(
                          hintText: "Kcal",
                        ),
                      ),
                    ],
                  )),
                ),
              ),
              buildList(recipe.ingredientlist, "Ingredient List", ingr),
              buildList(recipe.instructions, "Instructions", instr),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Center(
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Recipe Added"),
                          ),
                        );
                        _formKey.currentState!.save();
                        recipe.ingredients = recipe.ingredientlist.length;
                        recipeList.insert(0, recipe);
                      });
                    },
                    child: const Text("Save Recipe"),
                    style: ElevatedButton.styleFrom(
                      primary: red,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
