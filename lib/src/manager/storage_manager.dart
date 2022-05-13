import 'dart:developer';
import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:recappi/src/constants.dart';

class StorageManager {
  final storage = FirebaseStorage.instance.ref();

  Future<String> getImageUrl(String image) async {
    final imageRef = storage.child("images/" + image);
    final imageUrl = await imageRef.getDownloadURL();

    return imageUrl;
  }

  Future<String> getProfileImageUrl() async {
    final imageRef = storage.child("profile_images/" + auth.getUid() + ".jpg");
    final imageUrl = await imageRef.getDownloadURL();

    return imageUrl;
  }

  Future<String?> uploadImage(
      {required File file, required String userUid}) async {
    try {
      final ref = storage.child('profile_images').child(auth.getUid() + ".jpg");

      UploadTask imageUploadTask = ref.putFile(file);

      TaskSnapshot snapshot =
          await imageUploadTask.whenComplete(() => ref.getDownloadURL());

      return await snapshot.ref.getDownloadURL();
    } on FirebaseException catch (e) {
      log("$e");
      return null;
    }
  }
}
