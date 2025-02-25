import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../core/routes.dart';
import '../widgets/custom_button.dart';
import 'home_screen.dart'; // Import your HomeScreen
import '../services/google_auth.dart'; // Ensure this file exports FirebaseServices

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFF003580), // Booking.com Blue
        elevation: 0,
        title: Text(
          "Booking.com",
          style: GoogleFonts.montserrat(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ), // Back arrow in white
          onPressed: () => Navigator.pop(context), // Navigate back
        ),
      ),
      body: SingleChildScrollView(
        // ✅ Fixes overflow issue
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title
              Text(
                "Register here",
                style: GoogleFonts.montserrat(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                "We'll use this to create an account if you don't have one yet.",
                style: GoogleFonts.montserrat(
                  fontSize: 14,
                  color: Colors.grey[600],
                ),
              ),
              const SizedBox(height: 30),

              // Email Entry Box
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.grey.shade400),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    labelText: "Enter your name",
                    labelStyle: GoogleFonts.montserrat(
                        fontSize: 14, color: Colors.grey[600]),
                    border: InputBorder.none,
                  ),
                ),
              ),
              const SizedBox(height: 30),

              // Continue Button
              CustomButton(
                text: "Continue",
                onTap: () => Navigator.pushNamed(context, Routes.signUp),
                backgroundColor: const Color(0xFF003580),
                textColor: Colors.white,
              ),
              const SizedBox(height: 40),

              // OR Divider
              Row(
                children: [
                  Expanded(child: Divider(color: Colors.grey.shade400)),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      "OR",
                      style: GoogleFonts.montserrat(
                          fontSize: 14, color: Colors.black87),
                    ),
                  ),
                  Expanded(child: Divider(color: Colors.grey.shade400)),
                ],
              ),
              const SizedBox(height: 30),

              // Continue with Google Button
              CustomButton(
                text: "Continue with Google",
                onTap: () async {
                  // Debug print to confirm tap
                  print("Continue with Google pressed");

                  await FirebaseServices().signInWithGoogle();

                  // After sign-in, navigate to HomeScreen.
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomeScreen(),
                    ),
                  );
                },
                isOutlined: true,
                textColor: Colors.black,
                borderColor: Colors.grey.shade400,
                iconPath: "assets/images/google.png", // Google icon asset
              ),
              const SizedBox(height: 10),

              // Continue with Facebook Button
              CustomButton(
                text: "Continue with Facebook",
                onTap: () {},
                isOutlined: true,
                textColor: Colors.black,
                borderColor: Colors.grey.shade400,
                iconPath: "assets/images/facebook.png", // Facebook icon asset
              ),
              const SizedBox(height: 10),

              // Sign In Button
              Center(
                child: TextButton(
                  onPressed: () => Navigator.pushNamed(context, Routes.signIn),
                  child: Text(
                    "Already have an account? Sign In",
                    style: GoogleFonts.montserrat(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.blue,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
