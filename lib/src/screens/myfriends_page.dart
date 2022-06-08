import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:image_picker/image_picker.dart';
import 'package:recappi/src/manager/storage_manager.dart';
import 'package:recappi/src/models/recipe.dart';

import '../constants.dart';

class Discover extends StatefulWidget {
  const Discover({Key? key}) : super(key: key);

  @override
  State<Discover> createState() => _DiscoverState();
}

class _DiscoverState extends State<Discover> {
  setImageFile() async {
    final file = await getImagePickerFile();
    StorageManager().uploadImage(file: file, userUid: auth.getUid());
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const ImageBuilder(),
          ElevatedButton(
              onPressed: () => setImageFile(),
              child: const Text("Upload Image")),
          ElevatedButton(
              onPressed: () => fillFireStore(),
              child: const Text(
                "Upload recipe",
              ))
        ],
      ),
    );
  }
}

class ImageBuilder extends StatefulWidget {
  const ImageBuilder({Key? key}) : super(key: key);

  @override
  State<ImageBuilder> createState() => _ImageBuilderState();
}

class _ImageBuilderState extends State<ImageBuilder> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      initialData: const CircularProgressIndicator(),
      builder: (context, snapshot) {
        var ret = snapshot.data as Widget;
        return ret;
      },
      future: getPhoto(),
    );
  }
}

Future<Widget> getPhoto() async {
  final url = await StorageManager().getProfileImageUrl();

  return CachedNetworkImage(
    imageUrl: url,
    width: 300,
    fit: BoxFit.cover,
  );
}

getImagePickerFile() async {
  final ImagePicker _picker = ImagePicker();
  final XFile? image =
      await _picker.pickImage(source: ImageSource.camera, imageQuality: 30);

  return File(image!.path);
}
