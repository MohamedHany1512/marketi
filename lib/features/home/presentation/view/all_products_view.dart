import 'package:flutter/material.dart';
import '../../data/models/product_model.dart';
import 'widgets/product_card_widget.dart';

class AllProductsView extends StatelessWidget {
  final String title;
  final List<ProductModel> products;

  const AllProductsView({super.key, required this.title, required this.products});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.7,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
        ),
        itemCount: products.length,
        itemBuilder: (context, index) => ProductCardWidget(product: products[index]),
      ),
    );
  }
}