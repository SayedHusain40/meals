import 'package:flutter/material.dart';
import 'package:meals/models/category.dart';

class CategoryItem extends StatelessWidget {
  final Category category;
  const CategoryItem({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: .all(16),
        decoration: BoxDecoration(
          borderRadius: .circular(16),
          gradient: LinearGradient(
            colors: [
              category.color.withValues(alpha: 0.55),
              category.color.withValues(alpha: 0.9),
            ],
            begin: .topLeft,
            end: .bottomRight,
          ),
        ),
        child: Text(category.title, style: TextStyle(fontSize: 20)),
      ),
    );
  }
}
