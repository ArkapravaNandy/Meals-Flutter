import 'package:flutter/material.dart';
import 'package:mealtime/widgets/category_meals_screen.dart';
import './category_screen.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
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
        '/' : (ctx) => CategoryScreen(),
        CategoryMealsScreen.routeName: (ctx)=> CategoryMealsScreen(),
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
