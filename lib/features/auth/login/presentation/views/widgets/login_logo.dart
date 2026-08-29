
import 'package:flutter/material.dart';

class LoginLogo extends StatelessWidget {
  const LoginLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/Logo_Splash_Screen_android12.png',
      width: 130,
      height: 130,
      fit: BoxFit.contain,
    );
  }
}
