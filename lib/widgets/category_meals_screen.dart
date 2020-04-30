import 'package:flutter/material.dart';
//import 'package:mealtime/dummy_data.dart';


import '../models/meal.dart';
import 'package:mealtime/models/category.dart';
import 'package:mealtime/widgets/meal_item.dart';
class CategoryMealsScreen extends StatefulWidget {
  static const routeName='/category-meals';
   final List<Meal> availableMeals;
  CategoryMealsScreen(this.availableMeals);
 
  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  
  String categoryTitle;
  List<Meal> displayedMeals;

  @override
  void initState() {
    super.initState();
  }

  void _removeMeal(String mealId){
    setState(() {
      displayedMeals.removeWhere((meal)=>meal.id==mealId);
    });
  }
  @override
     void didChangeDependencies(){
        final routArgs= 
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    categoryTitle = routArgs['title'];
    final categoryId=routArgs['id'];
    displayedMeals = widget.availableMeals.where((meal){
      return meal.categories.contains(categoryId);
    }).toList();
    
        super.didChangeDependencies();

     }
    
  @override
  Widget build(BuildContext context) {
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
                id: displayedMeals[index].id,
                title: displayedMeals[index].title, 
              affordability: displayedMeals[index].affordability, 
              complexity: displayedMeals[index].complexity, 
              duration: displayedMeals[index].duration, 
              imageUrl: displayedMeals[index].imageUrl,
              removeItem:_removeMeal,);
              
            },
            itemCount: displayedMeals.length,
            ),
            
          );
        
     
  }
}