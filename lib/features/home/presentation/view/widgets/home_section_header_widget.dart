import 'package:flutter/material.dart';

class HomeSectionHeaderWidget extends StatelessWidget {
  final String title;
  final VoidCallback onViewAllPressed;

  const HomeSectionHeaderWidget({
    super.key,
    required this.title,
    required this.onViewAllPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        TextButton(
          onPressed: onViewAllPressed,
          child: const Text(
            'View all',
            style: TextStyle(color: Colors.blue, fontSize: 12),
          ),
        ),
      ],
    );
  }
}
