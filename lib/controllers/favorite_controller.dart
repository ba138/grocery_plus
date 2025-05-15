import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_plus/Models/grocery_model.dart';

class FavoriteController extends GetxController {
  var auth = FirebaseAuth.instance;
  var firestore = FirebaseFirestore.instance;
  var wishItems = <Items>[].obs;
  void fetchFavoriteItems() {
    try {
      firestore
          .collection("Users")
          .doc(auth.currentUser!.uid)
          .collection("wishList")
          .snapshots()
          .listen((snapshot) {
        wishItems.value =
            snapshot.docs.map((doc) => Items.fromMap(doc.data())).toList();
      });
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  deleteItem(String id) {
    try {
      firestore
          .collection("Users")
          .doc(auth.currentUser!.uid)
          .collection("wishList")
          .doc(id)
          .delete();
      Get.snackbar("Removed", "Item has been Deleted");
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  void onInit() {
    fetchFavoriteItems();
    super.onInit();
  }
}
