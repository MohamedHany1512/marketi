
import 'package:flutter/material.dart';

class RememberMeRow extends StatelessWidget {
  const RememberMeRow({
    super.key,
    required this.value,
    required this.onChanged,
  });

  final bool value;
  final VoidCallback onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: value,
          activeColor: const Color(0xFF3F7FFF),
          onChanged: (_) => onChanged(),
        ),
        const Text('Remember Me'),
        const Spacer(),
        TextButton(
          onPressed: () {},
          child: const Text('Forgot Password?'),
        ),
      ],
    );
  }
}
