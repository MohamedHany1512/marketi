
import 'package:flutter/material.dart';
import 'package:marketi/core/themes/app_colors.dart';

class SubmitButton extends StatelessWidget {
  const SubmitButton({super.key, required this.isLoading, required this.onPressed});

  final bool isLoading;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 45,
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: AppColors.backgroundLight,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
        ),
        child: isLoading
            ? const SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(
                  color: AppColors.backgroundLight,
                  strokeWidth: 2,
                ),
              )
            : const Text('Sign Up'),
      ),
    );
  }
}
