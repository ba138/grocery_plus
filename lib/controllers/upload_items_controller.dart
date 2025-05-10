import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_plus/Models/grocery_model.dart';
import 'package:grocery_plus/screens/bottom_Nav_bar.dart';
import 'package:grocery_plus/upload_image.dart';
import 'package:grocery_plus/widgets/loading_dialog_widget.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';

class UploadItemsController extends GetxController {
  var auth = FirebaseAuth.instance;
  var firestore = FirebaseFirestore.instance;
  var pickedImage = Rxn<XFile>();
  var imagePicker = ImagePicker();
  Future<void> pickImage() async {
    try {
      final XFile? selectedImage =
          await imagePicker.pickImage(source: ImageSource.camera);
      if (selectedImage != null) {
        pickedImage.value = selectedImage;
      }
    } catch (e) {
      debugPrint("Error while picking image: $e");
    }
  }

  void uploadData(String name, String discription, String price) async {
    try {
      Get.dialog(LoadingDialogWidget(), barrierDismissible: false);
      // var imageUrl = await uploadImageToFirebaseStorage(pickedImage.value!);
      var productId = Uuid().v1();
      Items items = Items(
          name: name,
          imageUrl: "imageUrl",
          descritpion: discription,
          price: price,
          productId: productId);
      await firestore.collection("products").doc(productId).set(items.toJson());
      Get.to(() => BottomNavBar());
      Get.snackbar(
        "Uploaded",
        "Item uploaded successfully",
        snackPosition: SnackPosition.TOP,
      );
    } catch (e) {
      Get.back();
      Get.snackbar(
        "Error",
        "Failed to upload item: $e",
        snackPosition: SnackPosition.TOP,
      );
    } finally {
      Get.back();
    }
  }
}
