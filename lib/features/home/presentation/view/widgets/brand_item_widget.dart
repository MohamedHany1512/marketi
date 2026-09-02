import 'package:flutter/material.dart';
import '../../../data/models/brand_model.dart';

class BrandItemWidget extends StatelessWidget {
  final BrandModel brand;

  const BrandItemWidget({super.key, required this.brand});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      margin: const EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Row(
        children: [
          if (brand.emoji != null) Text(brand.emoji!, style: const TextStyle(fontSize: 18)),
          if (brand.emoji != null) const SizedBox(width: 8),
          Text(brand.name ?? '', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
        ],
      ),
    );
  }
}