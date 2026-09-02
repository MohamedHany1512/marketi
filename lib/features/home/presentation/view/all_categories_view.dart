import 'package:flutter/material.dart';
import '../../data/models/category_model.dart';
import 'widgets/category_item_widget.dart';

class AllCategoriesView extends StatelessWidget {
  final List<CategoryModel> categories;

  const AllCategoriesView({super.key, required this.categories});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Categories'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 1,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
        ),
        itemCount: categories.length,
        itemBuilder: (context, index) => CategoryItemWidget(category: categories[index]),
      ),
    );
  }
}