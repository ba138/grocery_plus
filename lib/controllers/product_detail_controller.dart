import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_plus/Models/grocery_model.dart';
import 'package:grocery_plus/widgets/loading_dialog_widget.dart';

class ProductDetailController extends GetxController {
  var auth = FirebaseAuth.instance;
  var firestore = FirebaseFirestore.instance;
  var inWishList = false.obs;
  String? productId;
  ProductDetailController({required this.productId});
  Future<void> addToCart(String name, String imageUrl, String description,
      String price, String productId) async {
    try {
      Get.dialog(LoadingDialogWidget(), barrierDismissible: false);
      Items items = Items(
        name: name,
        imageUrl: imageUrl,
        descritpion: description,
        price: price,
        productId: productId,
      );
      await firestore
          .collection("Users")
          .doc(auth.currentUser!.uid)
          .collection('cartItems')
          .doc(productId)
          .set(items.toJson());
      debugPrint("upload done");

      Get.back();
      Get.snackbar("Added", "Item added to cart",
          snackPosition: SnackPosition.TOP);
    } catch (e) {
      Get.back();

      debugPrint(e.toString());
    } finally {
      Get.back();
    }
  }

  void checkWishList(String productId) {
    try {
      firestore
          .collection('Users')
          .doc(auth.currentUser!.uid)
          .collection('wishList')
          .doc(productId)
          .snapshots()
          .listen((data) {
        inWishList.value = data.exists;
        debugPrint("this is the value of item in wishList${inWishList.value}");
      });
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> addToWishList(String name, String imageUrl, String descritpion,
      String price, String productId) async {
    try {
      Items items = Items(
          name: name,
          imageUrl: imageUrl,
          descritpion: descritpion,
          price: price,
          productId: productId);
      await firestore
          .collection('Users')
          .doc(auth.currentUser!.uid)
          .collection('wishList')
          .doc(productId)
          .set(items.toJson());
      Get.snackbar("Added", "Item added to WishList");
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> removeFromWishList(String productId) async {
    try {
      await firestore
          .collection('Users')
          .doc(auth.currentUser!.uid)
          .collection('wishList')
          .doc(productId)
          .delete();
      Get.snackbar("Removed", "Item remove from WishList");
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  void onInit() {
    checkWishList(productId!);
    super.onInit();
  }
}
