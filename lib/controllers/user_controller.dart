import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_plus/Models/user_model.dart';
import 'package:grocery_plus/screens/login_screen.dart';

class UserController extends GetxController {
  var auth = FirebaseAuth.instance;
  var firestore = FirebaseFirestore.instance;
  var userModel = Rx<UserModel?>(null);
  Future<void> fetchCurrentUserData() async {
    try {
      var userData =
          await firestore.collection("Users").doc(auth.currentUser!.uid).get();
      if (userData.exists) {
        userModel.value = UserModel.fromMap(userData.data()!);
      } else {
        debugPrint("User data does not exist");
      }
    } catch (e) {
      debugPrint("this is the error$e");
    }
  }

  Future<void> logout() async {
    try {
      await auth.signOut();
      Get.offAll(() => LoginScreen());
    } on FirebaseAuthException catch (e) {
      debugPrint("this is the error${e.code}");
    }
  }

  @override
  void onInit() {
    fetchCurrentUserData();
    super.onInit();
  }
}
