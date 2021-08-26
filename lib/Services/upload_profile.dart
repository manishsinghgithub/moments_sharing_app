import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_app_check/firebase_app_check.dart';



File _imageFile;
final picker = ImagePicker();
final _storage = FirebaseStorage.instance;
final String userName = FirebaseAuth.instance.currentUser.email;

Future UploadFromGallery(BuildContext context) async {
  final pickedFile = await picker.getImage(source: ImageSource.gallery);
  _imageFile = File(pickedFile.path);

  assert(pickedFile != null);
  assert(FirebaseAuth.instance.currentUser.uid != null);
  var url = await UploadToFirebase(_imageFile);
  return url;
}

Future UploadFromCamera(BuildContext context) async {
  final pickedFile = await picker.getImage(source: ImageSource.camera);
  _imageFile = File(pickedFile.path);
  assert(pickedFile != null);
  var url = await UploadToFirebase(_imageFile);
  return url;
}

Future UploadToFirebase(File file) async {


  final TaskSnapshot snapshot = await _storage
      .ref()
      .child('profile/$userName/')
      .putFile(file)
      .whenComplete(() => print("done."));
  assert(snapshot.state == TaskState.success);
 // String downloadUrl = await snapshot.ref.getDownloadURL();

  String downloadURL = await FirebaseStorage.instance
      .ref('profile/$userName/')
      .getDownloadURL();
  return downloadURL;
}
