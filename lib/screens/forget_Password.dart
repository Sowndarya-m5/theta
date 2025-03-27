import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:theta/screens/login_screen.dart';

class ForgotPasswordScreen extends StatefulWidget {
  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final TextEditingController _emailController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  void _resetPassword() async {
    String email = _emailController.text.trim();
    if (email.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Please enter your email")),
      );
      return;
    }

    try {
      await _auth.sendPasswordResetEmail(email: email);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Password reset link sent to your email")),
      );

      // Navigate to the Login Screen after showing success message
      Future.delayed(Duration(seconds: 2), () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => SignInScreen()),
        );
      });

    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error in Network")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("asset/thetaapp.jpg"), // Ensure you have this image in your assets folder
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Content Over Background
          Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Forgot Password Title
                  const Text(
                    "Forgot Your Password?",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                      color: Colors.white, // Text color
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Email Input Field
                  TextField(
                    controller: _emailController,
                    style: TextStyle(color: Colors.black), // Input text color
                    decoration: InputDecoration(
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      labelText: "Enter Your Email",
                      labelStyle: TextStyle(color: Colors.black),
                      hintText: "example@gmail.com",
                      hintStyle: TextStyle(color: Colors.black54),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Reset Password Button
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepOrange,
                      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                    ),
                    onPressed: _resetPassword,
                    child: const Text(
                      "Send Reset Link",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Back Button
          Positioned(
            top: 40,
            left: 20,
            child: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.white, size: 30),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}
