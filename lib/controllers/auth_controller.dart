import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_plus/Models/user_model.dart';
import 'package:grocery_plus/screens/bottom_Nav_bar.dart';
import 'package:grocery_plus/screens/login_screen.dart';
import 'package:grocery_plus/widgets/loading_dialog_widget.dart';

class AuthController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;
  var fireStore = FirebaseFirestore.instance;

  Future<void> loginUser(String email, String password) async {
    try {
      Get.dialog(LoadingDialogWidget(), barrierDismissible: false);

      if (email.isEmpty || password.isEmpty) {
        Get.snackbar(
          "Error",
          "Please fill all the fields",
        );
        return;
      }
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      if (userCredential.user != null && userCredential.user!.emailVerified) {
        Get.offAll(() => BottomNavBar());
      } else {
        Get.snackbar("Error", "Please verify your email first",
            snackPosition: SnackPosition.BOTTOM);
      }
    } on FirebaseAuthException catch (e) {
      Get.back();
      debugPrint("this is the error${e.code}");
    } finally {
      Get.back();
    }
  }

  Future<void> registerUser(
      String email, String password, String name, String phoneNumber) async {
    try {
      Get.dialog(LoadingDialogWidget(), barrierDismissible: false);
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      if (userCredential.user != null) {
        userCredential.user!.sendEmailVerification();
        Get.snackbar("Verfied", "Verification email sent to $email",
            snackPosition: SnackPosition.TOP);
        // ScaffoldMessenger.of(context).showSnackBar(
        //     SnackBar(content: Text("Verification email sent to ${email}")));
        UserModel userData = UserModel(
            uid: auth.currentUser!.uid,
            username: name,
            email: email,
            phone: phoneNumber);
        await fireStore
            .collection("Users")
            .doc(auth.currentUser!.uid)
            .set(userData.toMap());
        Get.to(() => LoginScreen());
      }
    } on FirebaseAuthException catch (e) {
      Get.back();
      debugPrint(e.code);
    } finally {
      Get.back();
    }
  }

  Future<void> changePassword(
      String email, String oldPassword, String newPassword) async {
    Get.dialog(LoadingDialogWidget(), barrierDismissible: false);
    try {
      User? user = auth.currentUser;
      if (user == null) {
        Get.back();
        Get.snackbar("Error", "User not found");

        return;
      }
      var credential = await EmailAuthProvider.credential(
          email: email, password: oldPassword);
      await user.reauthenticateWithCredential(credential);
      await user.updatePassword(newPassword);
      Get.back();
      Get.snackbar("Changed", "Password has been Changed");
    } catch (e) {
      Get.back();
      debugPrint("this is the error$e");
    }
  }

  sendlinkForResetPassword(String email) async {
    if (email.isEmpty) {
      Get.snackbar("Error", "Please Enter Your Email");

      return;
    }
    Get.dialog(LoadingDialogWidget(), barrierDismissible: false);
    try {
      await auth.sendPasswordResetEmail(email: email);

      Get.back();
      Get.snackbar("Success", "Password Reset Link Sent Successfully");
    } on FirebaseAuthException catch (e) {
      Get.back();
      debugPrint("this is the error${e.code}");
    } finally {
      Get.back();
    }
  }
}
