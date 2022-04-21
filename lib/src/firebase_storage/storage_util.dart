import 'package:firebase_storage/firebase_storage.dart';

getImageUrl(String image) async {
  final storageRef = FirebaseStorage.instance.ref();
  final imageRef = storageRef.child("images/" + image);
  final imageUrl = await imageRef.getDownloadURL();

  return imageUrl;
}
