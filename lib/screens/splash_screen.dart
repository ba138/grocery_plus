import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Image.asset("images/splash_screen.dart"),
          Text("Grocery Plus",
              style: GoogleFonts.poppins(
                  fontSize: 24, fontWeight: FontWeight.w500))
        ],
      ),
    );
  }
}
