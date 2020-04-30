import 'package:flutter/material.dart';

import './dummy_data.dart';
import './widgets/category_item.dart';
import './models/meal.dart';
class CategoryScreen extends StatelessWidget {
  
  
  @override
  Widget build(BuildContext context) {
    return GridView(
        padding: const EdgeInsets.all(15),
        
        children:
          DUMMY_CATEGORIES
            .map(
            (catData)=>CategoryItem(
              catData.color,
              catData.title,
              catData.id,
            )
          ).toList()
        ,
      gridDelegate: 
      SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 3/2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,),
      
  
    ) ;
    }
}