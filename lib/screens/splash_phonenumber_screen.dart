import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_plus/constants/colors.dart';
import 'package:grocery_plus/widgets/custom_text_field.dart';
import 'package:grocery_plus/widgets/primary_button.dart';

class SplashPhonenumberScreen extends StatefulWidget {
  const SplashPhonenumberScreen({super.key});

  @override
  State<SplashPhonenumberScreen> createState() =>
      _SplashPhonenumberScreenState();
}

class _SplashPhonenumberScreenState extends State<SplashPhonenumberScreen> {
  final TextEditingController phoneController = TextEditingController();
  String? name;
  @override
  void dispose() {
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              Image.asset("images/phone_image.png"),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Enter your mobile number",
                        style: GoogleFonts.poppins(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: AppColors.fontColor,
                        )),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                        "We need to verify you. We will send you a one time verification code. ",
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: AppColors.fontGrayColor,
                        )),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomTextField(
                      hintText: "Phone Number",
                      prefixIcon: Icon(Icons.person),
                      controller: phoneController,
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    PrimaryButton(
                      title: "Next",
                      icon: Icons.arrow_forward,
                      ontap: () {
                        setState(() {
                          name = "Ali";
                        });
                      },
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
