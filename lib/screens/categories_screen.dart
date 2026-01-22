import 'package:flutter/material.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:meals/widgets/category_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
          childAspectRatio: 3 / 2,
        ),
        itemCount: availableCategories.length,
        itemBuilder: (context, index) {
          final category = availableCategories[index];
          return CategoryItem(category: category);
        },
      ),
    );
  }
}
