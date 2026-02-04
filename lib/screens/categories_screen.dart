import 'package:flutter/material.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/screens/meals_screen.dart';
import 'package:meals/widgets/category_item.dart';

class CategoriesScreen extends StatefulWidget {
  final List<Meal> availableMeals;
  const CategoriesScreen({super.key, required this.availableMeals});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  double _topPaddingContent = 100; // start with 100

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        _topPaddingContent = 24;
      });
    });
  }

  void onSelectCategory(
    BuildContext context,
    String categoryID,
    String categoryName,
  ) {
    final List<Meal> filteredMeals = widget.availableMeals
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
    return AnimatedPadding(
      duration: const Duration(milliseconds: 1000),
      curve: Curves.easeOutBack,
      padding: EdgeInsets.only(
        top: _topPaddingContent,
        left: 24,
        right: 24,
        bottom: 24,
      ),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
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
