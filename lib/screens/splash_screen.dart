import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_plus/screens/bottom_Nav_bar.dart';
import 'package:grocery_plus/screens/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  FirebaseAuth auth = FirebaseAuth.instance;
  @override
  void initState() {
    manageSession();
    super.initState();
  }

  manageSession() async {
    await Future.delayed(Duration(seconds: 3), () {
      if (auth.currentUser != null && auth.currentUser?.emailVerified == true) {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (c) => BottomNavBar()),
            (route) => false);
      } else {
        Navigator.pushAndRemoveUntil(context,
            MaterialPageRoute(builder: (c) => LoginScreen()), (route) => false);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
              "images/splash_image.png",
              height: 100,
              width: 200,
            ),
          ),
          Text("Grocery Plus",
              style: GoogleFonts.poppins(
                  fontSize: 24, fontWeight: FontWeight.w500))
        ],
      ),
    );
  }
}
