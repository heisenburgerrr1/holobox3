import 'package:flutter/material.dart';

class SharedLogo extends StatelessWidget {
  const SharedLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/logo3.png',
      width: 60,
      height: 60,
    );
  }
}