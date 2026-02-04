import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/providers/meals_provider.dart';

enum FiltersOptions { isGlutenFree, isVegan, isVegetarian, isLactoseFree }

class FilterNotifier extends Notifier<Map<FiltersOptions, bool>> {
  @override
  Map<FiltersOptions, bool> build() => {
    FiltersOptions.isGlutenFree: false,
    FiltersOptions.isVegan: false,
    FiltersOptions.isVegetarian: false,
    FiltersOptions.isLactoseFree: false,
  };

  void setFilters(Map<FiltersOptions, bool> newFilters) {
    state = newFilters;
  }

  void setFilter(FiltersOptions filtersOption, bool isActivated) {
    state = {...state, filtersOption: isActivated};
  }
}

final filterProvider =
    NotifierProvider<FilterNotifier, Map<FiltersOptions, bool>>(
      FilterNotifier.new,
    );

final filterMealProvider = Provider((ref) {
  final meals = ref.watch(availableMealsProvider);
  final activeFilters = ref.watch(filterProvider);

  return meals.where((meal) {
    if (!meal.isGlutenFree && activeFilters[FiltersOptions.isGlutenFree]!) {
      return false;
    }
    if (!meal.isLactoseFree && activeFilters[FiltersOptions.isLactoseFree]!) {
      return false;
    }
    if (!meal.isVegan && activeFilters[FiltersOptions.isVegan]!) {
      return false;
    }
    if (!meal.isVegetarian && activeFilters[FiltersOptions.isVegetarian]!) {
      return false;
    }
    return true;
  }).toList();
});
