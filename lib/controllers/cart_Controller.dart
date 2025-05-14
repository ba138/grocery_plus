import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_plus/Models/grocery_model.dart';

class CartController extends GetxController {
  var firestore = FirebaseFirestore.instance;
  var auth = FirebaseAuth.instance;
  var itemsData = <Items>[].obs;
  void getCartItems() {
    firestore
        .collection('Users')
        .doc(auth.currentUser!.uid)
        .collection("cartItems")
        .snapshots()
        .listen((snapShot) {
      itemsData.value =
          snapShot.docs.map((doc) => Items.fromMap(doc.data())).toList();
    });
  }

  Future<void> deleteCartItem(String productId) async {
    try {
      await firestore
          .collection("Users")
          .doc(auth.currentUser!.uid)
          .collection('cartItems')
          .doc(productId)
          .delete();
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  void onInit() {
    getCartItems();
    super.onInit();
  }
}
