import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

Future<String> uploadImageToFirebaseStorage(XFile image) async {
  // Get a reference to Firebase Storage
  FirebaseStorage storage = FirebaseStorage.instance;

  String fileName = DateTime.now().millisecondsSinceEpoch.toString();

  Reference ref = storage.ref().child('images/$fileName');

  try {
    UploadTask uploadTask = ref.putFile(File(image.path));

    TaskSnapshot taskSnapshot = await uploadTask;

    String downloadUrl = await taskSnapshot.ref.getDownloadURL();
    return downloadUrl;
  } catch (e) {
    print("Error uploading image: $e");
    return "";
  }
}
