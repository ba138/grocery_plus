import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_plus/Models/user_model.dart';
import 'package:grocery_plus/controllers/edit_profile_controller.dart';
import 'package:grocery_plus/widgets/custom_text_field.dart';
import 'package:grocery_plus/widgets/primary_button.dart';

class EditProfileScreen extends StatefulWidget {
  final UserModel currentUser;
  const EditProfileScreen({super.key, required this.currentUser});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  var controller = Get.put(EditProfileController());
  @override
  Widget build(BuildContext context) {
    var nameController =
        TextEditingController(text: widget.currentUser.username);
    var emailController = TextEditingController(text: widget.currentUser.email);
    var phoneController = TextEditingController(text: widget.currentUser.phone);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Obx(
                  () => controller.imageFile.value == null
                      ? CircleAvatar(
                          radius: 60,
                          backgroundImage: NetworkImage(widget
                                  .currentUser.profilePic ??
                              "https://www.pngall.com/wp-content/uploads/5/Avatar-Profile-PNG-Clipart.png"),
                          child: InkWell(
                              onTap: () {
                                controller.pickImage();
                              },
                              child: const Icon(Icons.camera_alt_outlined)),
                        )
                      : CircleAvatar(
                          radius: 60,
                          backgroundImage:
                              FileImage(File(controller.imageFile.value!.path)),
                          child: const Icon(Icons.camera_alt_outlined),
                        ),
                ),
                CustomTextField(
                    hintText: 'hintText', controller: nameController),
                const SizedBox(height: 10),
                CustomTextField(
                    hintText: 'hintText', controller: emailController),
                const SizedBox(height: 10),
                CustomTextField(
                    hintText: 'hintText', controller: phoneController),
                const SizedBox(height: 150),
                PrimaryButton(
                  title: 'Save',
                  ontap: () {
                    controller.updateUserProfile(
                        nameController.text,
                        widget.currentUser.profilePic ?? '',
                        emailController.text,
                        phoneController.text);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
