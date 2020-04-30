import 'package:flutter/material.dart';
import 'package:mealtime/dummy_data.dart';
import 'package:mealtime/widgets/category_meals_screen.dart';
import 'package:mealtime/widgets/meal_detail_screen.dart';
import 'package:mealtime/widgets/tab_screen.dart';
import './category_screen.dart';
import './widgets/filters_screen.dart';
import './widgets/filters_screen.dart';
import './models/meal.dart';
void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  
  Map<String, bool> _filters={
    'gluten':false,
    'lactose':false,
    'vegan':false,
    'vegetarian':false,
  };
  List<Meal> _availableMeals=DUMMY_MEALS;
  void _setFilters(Map<String, bool> filterData){
    setState(() {
      _filters=filterData;
      _availableMeals =DUMMY_MEALS.where((meal){
        if(_filters['gluten']==true && !meal.isGlutenFree)
          return false;
        if(_filters['lactose']==true && !meal.isLactoseFree)
          return false;
        if(_filters['vegan']==true && !meal.isVegan)
          return false;
        if(_filters['vegetarian']==true && !meal.isVegetarian)
          return false;
        return true;
      }).toList();
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MealTime',
      theme: ThemeData(
        fontFamily: 'Pacifico',
        textTheme: ThemeData.light().textTheme.copyWith(
          body1:TextStyle(
            color: Colors.white,),
          body2 :TextStyle(
            color :Colors.white,
            ) ,
          title: TextStyle(
            fontSize: 25,
            fontFamily: 'Pacifico',
            color: Colors.white,
            fontWeight: FontWeight.w300,
          ),   
        ),
        primarySwatch: Colors.purple,
        accentColor: Colors.amberAccent,
        canvasColor: Color.fromRGBO(255, 254, 229, 1)
      ),
      //home: CategoryScreen(),
      initialRoute: '/', //default is '/',
      routes: {
        '/' : (ctx) => TabScreen(),
        CategoryMealsScreen.routeName: (ctx)=> CategoryMealsScreen(_availableMeals),
        MealDetailScreen.routeName: (ctx)=>MealDetailScreen(),
        FiltersScreen.routeName: (ctx)=>FiltersScreen(_setFilters,_filters),
      },
      onGenerateRoute: (settings){
        print(settings.arguments);
        return MaterialPageRoute(builder: (ctx)=>CategoryScreen(),); 
      },
      onUnknownRoute: (settings){
        return MaterialPageRoute(builder: (ctx)=>CategoryScreen(),);
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
    @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DeliMeals'),
      ),
      body: Center(
        child: Text('Navigation Time!'),
      ),
    );
  }
}
