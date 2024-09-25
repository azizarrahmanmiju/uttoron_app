
import 'package:flutter/material.dart';

enum Categories {
  vegetables,
  Fruit,
  Meat,
  Hygiene,
  Convenience,
  Spices,
  Sweets,
  Carbs,
  Dairy

}


class Catagory {
  Catagory( { 
    required this.title,
     required this.color
   });

  final String title;
  final Color color;

  static var value;


}