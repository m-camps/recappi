import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:recappi/src/constants.dart';
import 'package:recappi/src/manager/storage_manager.dart';

class RecipeCard extends StatelessWidget {
  const RecipeCard({Key? key, required this.name}) : super(key: key);
  final String name;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: white,
      elevation: 3.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: SizedBox(
          height: 300,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Flexible(flex: 3, child: CardHeader()),
              Flexible(flex: 1, child: RecipeName(name)),
              Flexible(
                flex: 7,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      Flexible(flex: 1, child: GreyRedIconBlock()),
                      Flexible(flex: 1, child: RecipeImage()),
                    ],
                  ),
                ),
              ),
            ],
          )),
    );
  }
}

class RecipeName extends StatelessWidget {
  final String name;
  const RecipeName(this.name, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size.width.toInt() / 7;
    return Padding(
      padding: EdgeInsets.only(left: media),
      child: Text(
        name,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 20.0,
        ),
      ),
    );
  }
}

class RecipeImage extends StatelessWidget {
  const RecipeImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0, bottom: 8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: AspectRatio(
          aspectRatio: 1 / 1,
          child: FutureBuilder(
            initialData: const CircularProgressIndicator(),
            builder: (context, snapshot) {
              return CachedNetworkImage(
                imageUrl: snapshot.data.toString(),
                fit: BoxFit.cover,
              );
            },
            future: StorageManager().getImageUrl("recipe_3.jpg"),
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
    return ListTile(
      onTap: (() {}),
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(40.0),
        child: FutureBuilder(
          builder: ((context, snapshot) {
            if (!snapshot.hasData) {
              return const CircularProgressIndicator();
            }
            return CachedNetworkImage(
              imageUrl: snapshot.data.toString(),
              width: 50,
              height: 50,
              fit: BoxFit.cover,
            );
          }),
          future: StorageManager().getProfileImageUrl(),
        ),
      ),
      title: const Text("Author Name"),
      subtitle: const Text("Author quote"),
      contentPadding: const EdgeInsets.all(10.0),
    );
  }
}

class GreyRedIconBlock extends StatelessWidget {
  const GreyRedIconBlock({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Flexible(
          flex: 5,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              GreyIconSolo(Icons.timer, '5 min'),
              GreyIconSolo(Icons.local_fire_department, "314 kcal"),
              GreyIconSolo(Icons.list, "12 ingredients"),
            ],
          ),
        ),
        Flexible(
          flex: 2,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Flexible(
            flex: 1, fit: FlexFit.tight, child: Icon(icon, color: unselected)),
        Flexible(
          fit: FlexFit.tight,
          flex: 3,
          child: Text(data,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                color: unselected,
              )),
        ),
      ],
    );
  }
}

class RedIconSolo extends StatelessWidget {
  final String data;
  final IconData icon;
  const RedIconSolo(this.icon, this.data, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(onPressed: () {}, icon: Icon(icon), color: primaryRed),
        Text(data),
      ],
    );
  }
}
