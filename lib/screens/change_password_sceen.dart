import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:grocery_plus/widgets/custom_text_field.dart';
import 'package:grocery_plus/widgets/primary_button.dart';

class ChangePasswordSceen extends StatefulWidget {
  const ChangePasswordSceen({super.key});

  @override
  State<ChangePasswordSceen> createState() => _ChangePasswordSceenState();
}

class _ChangePasswordSceenState extends State<ChangePasswordSceen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  var auth = FirebaseAuth.instance;
  bool isLoading = false;
  Future<void> changePassword() async {
    try {
      setState(() {
        isLoading = true;
      });
      User? user = auth.currentUser;
      if (user == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("User not found")),
        );
        return;
      }
      var credential = await EmailAuthProvider.credential(
          email: emailController.text, password: passwordController.text);
      await user.reauthenticateWithCredential(credential);
      await user.updatePassword(newPasswordController.text);
      setState(() {
        isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Password updated successfully")),
      );
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      debugPrint("this is the error$e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: isLoading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : Column(
                    children: [
                      CustomTextField(
                          hintText: "Enter Your Email",
                          controller: emailController),
                      const SizedBox(height: 20),
                      CustomTextField(
                          hintText: "Enter Your old Password",
                          controller: passwordController),
                      const SizedBox(height: 20),
                      CustomTextField(
                        hintText: "Enter your new password",
                        controller: newPasswordController,
                      ),
                      const SizedBox(height: 300),
                      PrimaryButton(
                          title: "Update",
                          ontap: () {
                            changePassword();
                          })
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
