import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_plus/constants/colors.dart';
import 'package:grocery_plus/widgets/custom_text_field.dart';
import 'package:grocery_plus/widgets/primary_button.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final TextEditingController emailController = TextEditingController();
  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Forget Password"),
        centerTitle: true,
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back_ios)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 50,
              ),
              Image.asset(
                "images/splash_image.png",
                height: 100,
                width: 200,
              ),
              const SizedBox(
                height: 30,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Please Enter Your Email Address",
                  style: GoogleFonts.poppins(fontSize: 16),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              CustomTextField(
                  hintText: "Enter you mail",
                  prefixIcon: Icon(
                    Icons.mail,
                    color: AppColors.primaryColor,
                  ),
                  controller: emailController),
              const SizedBox(
                height: 250,
              ),
              PrimaryButton(title: "Send Mail", icon: Icons.mail, ontap: () {})
            ],
          ),
        ),
      ),
    );
  }
}
