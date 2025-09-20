import 'package:flutter/material.dart';
import 'dart:ui';
import 'login_screen.dart';

class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/3adba8cf-3b9d-44d0-b813-3e3718723560.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                const SizedBox(height: 270),

                // Centered circular logo using logo3
                Center(
                  child: Image.asset(
                    'assets/logo4.png',
                    width: 150,
                    height: 150,
                  ),
                ),

                // Using your current -55 offset
                Transform.translate(
                  offset: const Offset(0, -55),
                  child: Center(
                    child: Image.asset(
                      'assets/logo6.png',
                      height: 80,
                    ),
                  ),
                ),

                // Large spacer to push text toward bottom
                const Spacer(flex: 3), // More space above text

                // Main text - positioned closer to button
                const Text(
                  "FUTURE OF",
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 2,
                    color: Colors.black,
                  ),
                ),
                const Text(
                  "ADVERTISEMENTS",
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2,
                    color: Colors.black,
                  ),
                ),

                // Smaller spacer between text and button - brings text closer to button
                const Spacer(flex: 1), // Much less space below text

                // Get Started button
                Container(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const LoginScreen()),
                      );
                    },
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Get Started",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(width: 8),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 16,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
