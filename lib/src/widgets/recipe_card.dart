import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:recappi/src/constants.dart';

class RecipeCard extends StatelessWidget {
  const RecipeCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: white,
      elevation: 5.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: SizedBox(
          height: 300,
          child: Column(
            children: [
              const CardHeader(),
              SizedBox(
                height: 200,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Flexible(flex: 1, child: GreyRedIconBlock()),
                    Flexible(flex: 1, child: RecipeImage()),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}

class RecipeImage extends StatelessWidget {
  const RecipeImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.all(10.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: AspectRatio(
          aspectRatio: 1 / 1,
          child: CachedNetworkImage(
            imageUrl: "assets/images/recipe_1.jpg",
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

class CardHeader extends StatelessWidget {
  const CardHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: white,
      elevation: 0.0,
      child: ListTile(
        onTap: (() {}),
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(40.0),
          child: Image.asset(
            "assets/images/portrait_1.jpg",
            height: 100.0,
          ),
        ),
        title: const Text("Author Name"),
        subtitle: const Text("Author quote"),
        contentPadding: const EdgeInsets.all(10.0),
      ),
    );
  }
}

class GreyRedIconBlock extends StatelessWidget {
  const GreyRedIconBlock({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Flexible(
          flex: 2,
          child: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Column(
              children: const [
                GreyIconSolo(Icons.timer, '5 min'),
                GreyIconSolo(Icons.local_fire_department, "314 kcal"),
                GreyIconSolo(Icons.list, "12 ingredients"),
              ],
            ),
          ),
        ),
        Flexible(
          flex: 1,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: const [
              RedIconSolo(Icons.favorite_border_outlined, "8"),
              RedIconSolo(Icons.mode_comment_outlined, "10")
            ],
          ),
        ),
      ],
    );
  }
}

class GreyIconSolo extends StatelessWidget {
  final String data;
  final IconData icon;
  const GreyIconSolo(this.icon, this.data, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(icon, color: unselected),
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Text(data,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  color: unselected,
                )),
          ),
        ],
      ),
    );
  }
}

class RedIconSolo extends StatelessWidget {
  final String data;
  final IconData icon;
  const RedIconSolo(this.icon, this.data, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          IconButton(onPressed: () {}, icon: Icon(icon), color: primaryRed),
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Text(data),
          ),
        ],
      ),
    );
  }
}
