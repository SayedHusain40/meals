import 'package:flutter/material.dart';

import 'package:meals/models/meal.dart';
import 'package:meals/widgets/meal_item.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({super.key, this.title, required this.meals});

  final String? title;
  final List<Meal> meals;

  @override
  Widget build(BuildContext context) {
    Widget content = Center(child: Text('Uh oh ... nothing here!'));

    if (meals.isNotEmpty) {
      content = ListView.builder(
        itemCount: meals.length,
        itemBuilder: (ctx, index) {
          final Meal meal = meals[index];
          return MealItem(meal: meal);
        },
      );
    }

    if (title != null) {
      return Scaffold(
        appBar: AppBar(title: Text(title!)),
        body: content,
      );
    }

    return content;
  }
}
