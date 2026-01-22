import 'package:flutter/material.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/screens/categories_screen.dart';
import 'package:meals/screens/meals_screen.dart';

class MainTabs extends StatefulWidget {
  const MainTabs({super.key});

  @override
  State<MainTabs> createState() => _MainTabsState();
}

class _MainTabsState extends State<MainTabs> {
  int _currentScreenIndex = 0;
  final List<Meal> meals = dummyMeals; 

  @override
  Widget build(BuildContext context) {
      final List<Widget> _screen = [CategoriesScreen(meals: meals,), MealsScreen(meals: [],)];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          _currentScreenIndex == 0
              ? 'Categories Section'
              : 'Your Favorites Meals',
        ),
      ),
      body: _screen[_currentScreenIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentScreenIndex,
        onDestinationSelected: (value) {
          setState(() {
            _currentScreenIndex = value;
          });
        },
        destinations: [
          NavigationDestination(
            icon: Icon(Icons.food_bank),
            label: 'Categories',
          ),
          NavigationDestination(
            icon: Icon(Icons.star),
            label: 'My Favorite meals',
          ),
        ],
      ),
    );
  }
}
