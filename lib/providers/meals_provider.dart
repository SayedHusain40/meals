import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:meals/data/dummy_data.dart';

// Use Provider because dummyMeals is constant
final availableMealsProvider = Provider((ref) => dummyMeals);