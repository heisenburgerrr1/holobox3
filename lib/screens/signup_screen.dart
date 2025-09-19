import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool _acceptedTerms = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Grey background image covering full screen (same as login)
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/3adba8cf-3b9d-44d0-b813-3e3718723560.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Small logo3.png at top right - same as login screen
          Positioned(
            top: 15,
            right: 20,
            child: SafeArea(
              child: Image.asset(
                'assets/logo3.png',
                width: 40,
                height: 40,
              ),
            ),
          ),

          // White rounded container - same as login screen
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.88, // Slightly taller for more fields
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  children: [
                    const SizedBox(height: 20), // Less space at top

                    // Create account title
                    const Text(
                      "Create your account.",
                      style: TextStyle(
                        fontSize: 24, // Smaller to match login
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),

                    const SizedBox(height: 30),

                    // Name field
                    _buildInputField("Name", "ex: jon smith"),

                    const SizedBox(height: 20),

                    // Email field
                    _buildInputField("Email", "ex: jon.smith@email.com"),

                    const SizedBox(height: 20),

                    // Password field
                    _buildInputField("Password", "********", isPassword: true),

                    const SizedBox(height: 20),

                    // Confirm password field
                    _buildInputField("Confirm password", "********", isPassword: true),

                    const SizedBox(height: 20),

                    // Terms checkbox
                    Row(
                      children: [
                        Checkbox(
                          value: _acceptedTerms,
                          onChanged: (value) {
                            setState(() {
                              _acceptedTerms = value ?? false;
                            });
                          },
                          activeColor: Colors.black,
                          checkColor: Colors.white,
                          side: const BorderSide(color: Colors.grey),
                        ),
                        const Text(
                          "I understood the ",
                          style: TextStyle(color: Colors.black),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: const Text(
                            "terms & policy.",
                            style: TextStyle(
                              color: Colors.blue,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 20),

                    // Sign up button
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                        onPressed: () {},
                        child: const Text(
                          "SIGN UP",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 20), // Reduced spacing

                    // "or" text
                    const Text(
                      "or",
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),

                    const SizedBox(height: 15), // Reduced spacing

                    // Social media buttons with dark gray theme (matching login)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _socialIconButton(FontAwesomeIcons.google, Colors.grey[700]!),
                        const SizedBox(width: 20),
                        _socialIconButton(FontAwesomeIcons.facebook, Colors.grey[700]!),
                        const SizedBox(width: 20),
                        _socialIconButton(FontAwesomeIcons.twitter, Colors.grey[700]!),
                      ],
                    ),

                    const Spacer(),

                    // Sign in link
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Text.rich(
                        TextSpan(
                          text: "Have an account? ",
                          style: TextStyle(fontSize: 14, color: Colors.grey),
                          children: [
                            TextSpan(
                              text: "SIGN IN",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
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
        ],
      ),
    );
  }

  Widget _buildInputField(String label, String hint, {bool isPassword = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          obscureText: isPassword,
          style: const TextStyle(color: Colors.black),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(color: Colors.grey[500]),
            border: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey[300]!),
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey[300]!),
            ),
          ),
        ),
      ],
    );
  }

  Widget _socialIconButton(IconData icon, Color color) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        shape: BoxShape.circle,
        border: Border.all(color: Colors.grey[400]!, width: 1),
      ),
      child: Center(
        child: FaIcon(
          icon,
          size: 20,
          color: color, // Dark gray theme matching login
        ),
      ),
    );
  }
}
