import 'package:uttoron_app/data/cetagories.dart';

import 'package:uttoron_app/model/Category.dart';
import 'package:uttoron_app/model/mealitembp.dart';

final mealdata = [
  Mealitembp(
      id: 'a',
      name: 'potato',
      quantity: 30,
      catagory: categories[Categories.Spices]!),
  Mealitembp(
      id: 'b',
      name: 'Milk',
      quantity: 60,
      catagory: categories[Categories.Fruit]!),
  Mealitembp(
      id: 'c',
      name: 'water',
      quantity: 4,
      catagory: categories[Categories.Dairy]!),
  Mealitembp(
      id: 'd',
      name: 'noodles',
      quantity: 9,
      catagory: categories[Categories.Carbs]!),
  Mealitembp(
      id: 'e',
      name: 'apple',
      quantity: 40,
      catagory: categories[Categories.Fruit]!),

];