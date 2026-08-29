
import 'package:flutter/material.dart';

class BackButton extends StatelessWidget {
  final VoidCallback onPressed;

  const BackButton({super.key, 
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,

      borderRadius:
          BorderRadius.circular(50),

      child: Container(
        width: 32,
        height: 32,

        decoration:
            BoxDecoration(
          shape: BoxShape.circle,

          border: Border.all(
            color: const Color(
              0xFFD5E2FF,
            ),
          ),
        ),

        child: const Icon(
          Icons.arrow_back_ios_new,
          size: 14,
          color: Colors.black,
        ),
      ),
    );
  }
}