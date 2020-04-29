import 'package:flutter/material.dart';
import 'package:mealtime/models/meal.dart';
import 'package:mealtime/widgets/meal_detail_screen.dart';

class MealItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;

  MealItem({
    @required this.id,
    @required this.title,
    @required this.affordability,
    @required this.complexity,
    //@required this.complexity,
    @required this.duration,
    @required this.imageUrl,
  });
  String get complexityText{
    switch(complexity){
      case Complexity.Simple : 
        return "Simple";
        break;
      case Complexity.Hard :
      return "Hard";
      break;

      case Complexity.Challenging :
      return "Challenging";
      break;

       default : return "unknown";
    }
  }
  String get affordabilityText{
    switch(affordability){
      case Affordability.Affordable : 
        return "Affordable";
        break;
      case Affordability.Luxurious :
      return "Luxurious";
      break;

      case Affordability.Pricey :
      return "Pricey";
      break;

       default : return "unknown";
    }
  }
  
  void selectMeal(BuildContext context){
    Navigator.of(context).pushNamed(MealDetailScreen.routeName, arguments: id,);
  }
  
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap : ()=>selectMeal(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10) 
        ),
        elevation:5,
        margin: EdgeInsets.all(10),
        child: Column(children: <Widget>[
          Stack(children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10), 
                topRight: Radius.circular(10)
                ) ,
                child: Image.network(
                  imageUrl,
                  height: 250,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  ),
            ),
             //Positoned helps us configure where the text lies over the image
             Positioned(
                bottom: 20,
                right: 10,
                child: Container(
                  padding:EdgeInsets.symmetric(vertical:5, horizontal:20),
                  width:250,
                  color: Colors.black54,                
                  child: Text(
                  title, style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w200,
                  ),
                  softWrap: true,
                  overflow: TextOverflow.fade,),
                ),
             ),
          ],
          ),
          Padding(padding: EdgeInsets.all(10),
          //height: 50,
          
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
              Icon(Icons.schedule),
            SizedBox(width:60,
            
            child:
            Text('$duration min',style:TextStyle(color:Colors.black)),),
            
            ],)
            ,Row(
              mainAxisAlignment:MainAxisAlignment.center,
              children: <Widget>[
              
            Icon(Icons.work),
            SizedBox( width: 70,
            child:
            Text(complexityText,
            style: TextStyle(color: Colors.black)),),
            
          ],),
          Row(
            children: <Widget>[
              Icon(Icons.attach_money),
              SizedBox( width: 60,
              child:
              Text(affordabilityText,
                style: TextStyle(color: Colors.black)),),
            
            ],
          )
            
          ],),),
          
        ],),
      ),
    );
  }
}