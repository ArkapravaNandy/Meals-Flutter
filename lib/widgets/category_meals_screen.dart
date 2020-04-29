import 'package:flutter/material.dart';
import 'package:mealtime/dummy_data.dart';


import 'package:mealtime/models/category.dart';
import 'package:mealtime/widgets/meal_item.dart';
class CategoryMealsScreen extends StatelessWidget {
  static const routeName='/category-meals';
//  final String title;
//  final String id;
//  final Color color;
  
  //CategoryMealsScreen(this.title, this.color, this.id);

  @override
  Widget build(BuildContext context) {
    final routArgs= ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categoryTitle = routArgs['title'];
    final categoryId=routArgs['id'];
    final categoryMeals = DUMMY_MEALS.where((meal){
      return meal.categories.contains(categoryId);
    }).toList();
    return Scaffold(
      appBar: AppBar(
        title:
        Text(categoryTitle),
       
      ),
      body: 
    
            ListView.builder(
              itemBuilder: (
                ctx, index
                ){
              return MealItem(
                id: categoryMeals[index].id,
                title: categoryMeals[index].title, 
              affordability: categoryMeals[index].affordability, 
              complexity: categoryMeals[index].complexity, 
              duration: categoryMeals[index].duration, 
              imageUrl: categoryMeals[index].imageUrl);
            },
            itemCount: categoryMeals.length,
            ),
            
          );
        
      
     
    
  }
}