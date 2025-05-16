import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:get/utils.dart';
import 'package:grocery_plus/Models/user_model.dart';
import 'package:grocery_plus/controllers/user_controller.dart';
import 'package:grocery_plus/screens/change_password_sceen.dart';
import 'package:grocery_plus/screens/edit_profile_screen.dart';
import 'package:grocery_plus/screens/login_screen.dart';
import 'package:grocery_plus/widgets/profile_widget.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  var auth = FirebaseAuth.instance;
  var firestore = FirebaseFirestore.instance;
  UserModel? currentUser;

  var userController = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(currentUser?.username ?? "profile"),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 20),
        child: Column(
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(userController
                      .userModel.value?.profilePic ??
                  "https://www.pngall.com/wp-content/uploads/5/Avatar-Profile-PNG-Clipart.png"),
            ),
            Text(userController.userModel.value?.username ?? "Loading"),
            Divider(
              color: Colors.grey.shade300,
              thickness: 1.5,
            ),
            const SizedBox(
              height: 20,
            ),
            ProfileWidget(
                leadingIcon: Icons.edit,
                title: "Edit Profile",
                ontap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (c) => EditProfileScreen(
                                currentUser: userController.userModel.value!,
                              )));
                }),
            const SizedBox(
              height: 20,
            ),
            ProfileWidget(
                leadingIcon: Icons.lock,
                title: "Change Password",
                ontap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (c) => const ChangePasswordSceen()));
                }),
            const SizedBox(
              height: 20,
            ),
            ProfileWidget(
                leadingIcon: Icons.logout,
                title: "Logout",
                ontap: () {
                  userController.logout();
                }),
          ],
        ),
      ),
    );
  }
}
