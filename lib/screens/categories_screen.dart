import 'package:flutter/material.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/screens/meals_screen.dart';
import 'package:meals/widgets/category_item.dart';

class CategoriesScreen extends StatelessWidget {
  final List<Meal> meals;
  const CategoriesScreen({super.key, required this.meals});

  void onSelectCategory(
    BuildContext context,
    String categoryID,
    String categoryName,
  ) {
    final List<Meal> filteredMeals = meals
        .where((meal) => meal.categories.contains(categoryID))
        .toList();

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            MealsScreen(title: categoryName, meals: filteredMeals),
      ),
    );
  }

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
          return CategoryItem(
            category: category,
            onSelectCategory: () =>
                onSelectCategory(context, category.id, category.title),
          );
        },
      ),
    );
  }
}
