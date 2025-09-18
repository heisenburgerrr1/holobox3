import 'package:flutter/material.dart';
import 'login_screen.dart';

class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              const SizedBox(height: 100),
              // Centered bigger circular logo
              Center(
                child: Image.asset(
                  'assets/logo3.png',
                  width: 130,
                  height: 130,
                ),
              ),
              const SizedBox(height: 60),
              // Main text - centered and black
              const Text(
                "FUTURE OF",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 1,
                  color: Colors.black,
                ),
              ),
              const Text(
                "ADVERTISEMENTS",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 40),
              // Box illustration using asset - below text
              Image.asset(
                'assets/box.png',
                width: 140,
                height: 140,
              ),
              const Spacer(),
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
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}