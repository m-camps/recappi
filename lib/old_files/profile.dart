import 'package:flutter/material.dart';
import 'style.dart';
import 'dart:math';
import 'data.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    final recipe = ModalRoute.of(context)!.settings.arguments as Recipe;
    return Scaffold(
      backgroundColor: backgroundRed,
      appBar: AppBar(
        backgroundColor: red,
      ),
      body: ListView(
        children: [
          Card(
            child: Column(
              children: [
                Row(
                  children: [
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(200),
                          child: Image.asset(recipe.author.portrait,
                              width: 100.0, height: 100.0, fit: BoxFit.cover),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Text(
                              recipe.author.name,
                              style: const TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.w600,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              profileSubData(
                                Random().nextInt(100).toString(),
                                "recepten",
                              ),
                              profileSubData(
                                Random().nextInt(999).toString(),
                                "volgers",
                              ),
                              profileSubData(
                                Random().nextInt(500).toString(),
                                "likes",
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    lorum,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 4,
                  ),
                ),
              ],
            ),
          ),
          scrollImages(10, "Recently Saved"),
          scrollImages(10, "Favorites"),
          scrollImages(10, "Likes"),
        ],
      ),
    );
  }

  Widget scrollImages(int amount, String header) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            header,
            style: const TextStyle(fontSize: 28.0),
          ),
        ),
        SizedBox(
          height: 150,
          child: ListView(
            physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics()),
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            children: imageStack(10),
          ),
        )
      ],
    );
  }

  Widget horScrollImages(int amount) {
    return SizedBox(
      height: 150,
      child: ListView(
        physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()),
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        children: imageStack(5),
      ),
    );
  }

  List<Widget> imageStack(int amount) {
    List<Widget> ret = <Widget>[];
    for (int i = 0; i < amount; i++) {
      ret.add(
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: Stack(
            alignment: AlignmentDirectional.bottomEnd,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.asset(
                  recipePhotos[Random().nextInt(5)],
                  height: 150.0,
                  width: 150.0,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        ),
      );
    }
    return ret;
  }

  Widget profileSubData(String amount, String str) {
    return Padding(
      padding: const EdgeInsets.only(left: 12.0),
      child: Column(
        children: [
          Text(amount,
              style: const TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w500,
              )),
          Text(
            str,
            style: const TextStyle(color: greyColor),
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
