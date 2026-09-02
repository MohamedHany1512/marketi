import 'package:flutter/material.dart';
import '../../data/models/brand_model.dart';
import 'widgets/brand_item_widget.dart';

class AllBrandsView extends StatelessWidget {
  final List<BrandModel> brands;

  const AllBrandsView({super.key, required this.brands});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Brands'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: brands.length,
        separatorBuilder: (_, _) => const SizedBox(height: 12),
        itemBuilder: (context, index) => BrandItemWidget(brand: brands[index]),
      ),
    );
  }
}