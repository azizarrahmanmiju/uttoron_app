

import 'package:uttoron_app/model/Category.dart';



class Mealitembp{

  const Mealitembp({
   
   required this.catagory, 
  required this.name,
   required this.quantity,
  required this.id, 
    
  });


  final String id;
  final String name;
  final int  quantity;
  final Catagory catagory;
}