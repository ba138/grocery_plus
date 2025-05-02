import 'package:flutter/material.dart';
import 'package:grocery_plus/Models/user_model.dart';
import 'package:grocery_plus/widgets/custom_text_field.dart';

class EditProfileScreen extends StatefulWidget {
  final UserModel currentUser;
  const EditProfileScreen({super.key, required this.currentUser});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  @override
  Widget build(BuildContext context) {
    var nameController =
        TextEditingController(text: widget.currentUser.username);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              CircleAvatar(
                radius: 60,
                backgroundImage: NetworkImage(widget.currentUser.profilePic ??
                    "https://www.pngall.com/wp-content/uploads/5/Avatar-Profile-PNG-Clipart.png"),
                child: const Icon(Icons.camera_alt_outlined),
              ),
              CustomTextField(hintText: 'hintText', controller: nameController)
            ],
          ),
        ),
      ),
    );
  }
}
