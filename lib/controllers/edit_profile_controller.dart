import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_plus/upload_image.dart';
import 'package:grocery_plus/widgets/loading_dialog_widget.dart';
import 'package:image_picker/image_picker.dart';

class EditProfileController extends GetxController {
  var auth = FirebaseAuth.instance;
  var firestore = FirebaseFirestore.instance;
  var imageFile = Rxn<XFile>();
  var imagePicker = ImagePicker();
  Future<void> pickImage() async {
    try {
      final XFile? selectedImage =
          await imagePicker.pickImage(source: ImageSource.camera);
      if (selectedImage != null) {
        imageFile.value = selectedImage;
      }
    } catch (e) {
      debugPrint("Error while picking image: $e");
    }
  }

  Future<void> updateUserProfile(
      String username, String userProfile, String email, String phone) async {
    try {
      Get.dialog(LoadingDialogWidget(), barrierDismissible: false);

      String imageUrl = userProfile;
      if (imageFile != null) {
        imageUrl = await uploadImageToFirebaseStorage(imageFile.value!);
      }

      await firestore.collection('Users').doc(auth.currentUser!.uid).update({
        'username': username,
        'profilePic': imageUrl,
        'email': email,
        'phone': phone,
      });
      Get.back();
      debugPrint('User profile updated successfully!');
    } catch (e) {
      Get.back();
      debugPrint(e.toString());
    }
  }
}
