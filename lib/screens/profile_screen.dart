import 'package:flutter/material.dart';
import 'package:grocery_plus/widgets/profile_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 20),
        child: Column(
          children: [
            ProfileWidget(
                leadingIcon: Icons.logout, title: "Logout", ontap: () {})
          ],
        ),
      ),
    );
  }
}
