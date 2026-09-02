import 'package:flutter/material.dart';

class SpecialDealBannerWidget extends StatelessWidget {
  const SpecialDealBannerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 110,
      decoration: BoxDecoration(
        color: Colors.lightBlue,
        borderRadius: BorderRadius.circular(12),
      ),
      child: const Center(
        child: Text(
          'SPECIAL DEAL\nSUPER OFFER',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
