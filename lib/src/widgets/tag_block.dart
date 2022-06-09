import 'package:flutter/material.dart';
import 'package:recappi/src/constants.dart';
import 'package:recappi/src/models/recipe.dart';

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
