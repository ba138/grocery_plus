import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_plus/constants/colors.dart';
import 'package:grocery_plus/widgets/primary_button.dart';

class SplashPhonenumberScreen extends StatelessWidget {
  const SplashPhonenumberScreen({super.key});

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
                    TextField(
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Phone Number",
                          prefixIcon: Icon(Icons.phone_outlined),
                          fillColor: Color(0xffF0F1F2),
                          filled: true,
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide:
                                  BorderSide(color: Colors.transparent))),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    PrimaryButton(
                      title: "Next",
                      icon: Icons.arrow_forward,
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
