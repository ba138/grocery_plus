import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:grocery_plus/Models/user_model.dart';
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
  Future<void> logout() async {
    try {
      await auth.signOut();
      Navigator.pushAndRemoveUntil(context,
          MaterialPageRoute(builder: (c) => LoginScreen()), (route) => false);
    } on FirebaseAuthException catch (e) {
      debugPrint("this is the error${e.code}");
    }
  }

  Future<void> fetchCurrentUserData() async {
    try {
      var userData =
          await firestore.collection("Users").doc(auth.currentUser!.uid).get();
      if (userData.exists) {
        setState(() {
          currentUser = UserModel.fromMap(userData.data()!);
        });
      } else {
        debugPrint("User data does not exist");
      }
    } catch (e) {
      debugPrint("this is the error$e");
    }
  }

  @override
  void initState() {
    fetchCurrentUserData();
    super.initState();
  }

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
              backgroundImage: NetworkImage(currentUser?.profilePic ??
                  "https://www.pngall.com/wp-content/uploads/5/Avatar-Profile-PNG-Clipart.png"),
            ),
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
                                currentUser: currentUser!,
                              )));
                }),
            const SizedBox(
              height: 20,
            ),
            ProfileWidget(
                leadingIcon: Icons.logout,
                title: "Logout",
                ontap: () {
                  logout();
                }),
          ],
        ),
      ),
    );
  }
}
