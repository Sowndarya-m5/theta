import 'dart:async';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:theta/screens/welcome_screen.dart';
import '../screens/btm_bar.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  void startTimer() {
    Timer(const Duration(seconds: 3), () async {
      User? user = _auth.currentUser;

      if (user != null) {
        // If user is logged in, navigate to the home screen
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => BottomBarScreen()),
        );
      } else {
        // If no user is logged in, navigate to login screen
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => WelcomeScreen()),
        );
      }
    });
  }

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    bool isDarkTheme = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              isDarkTheme ? "asset/WhiteLogoorg.png" : "asset/srclogo.png",
            ),
          ],
        ),
      ),
    );
  }
}
