import 'package:flutter/material.dart';
import 'package:marketi/core/routing/app_routes.dart';
import 'package:marketi/core/themes/app_theme.dart';

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
        backgroundColor: AppTheme.lightTheme.appBarTheme.backgroundColor,
        foregroundColor: AppTheme.lightTheme.appBarTheme.foregroundColor,
        elevation: 0,
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: brands.length,
        separatorBuilder: (_, _) => const SizedBox(height: 12),
        itemBuilder: (context, index) {
          final brand = brands[index];
          return InkWell(
            onTap: brand.name == null
                ? null
                : () => Navigator.pushNamed(
                    context,
                    AppRoutes.brandProducts,
                    arguments: brand.name,
                  ),
            child: BrandItemWidget(brand: brand),
          );
        },
      ),
    );
  }
}
