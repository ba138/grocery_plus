import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_plus/screens/bottom_Nav_bar.dart';
import 'package:grocery_plus/screens/login_screen.dart';

class SplashController extends GetxController {
  var auth = FirebaseAuth.instance;
  @override
  void onInit() {
    manageSession();
    super.onInit();
  }

  Future<void> manageSession() async {
    try {
      await Future.delayed(Duration(seconds: 3), () {
        if (auth.currentUser != null &&
            auth.currentUser?.emailVerified == true) {
          Get.offAll(() => BottomNavBar());
        } else {
          Get.offAll(() => LoginScreen());
        }
      });
    } catch (e) {
      debugPrint("this is the error$e");
    }
  }
}
