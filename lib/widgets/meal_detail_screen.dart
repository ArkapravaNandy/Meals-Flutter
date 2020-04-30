import '../dummy_data.dart';
import 'package:flutter/material.dart';
class MealDetailScreen extends StatelessWidget {
  static const routeName = '/meal-detail';
  
  Widget buildSectionTitle (BuildContext context,String text){
    return Container(
      margin:EdgeInsets.symmetric(vertical:5),
      child:Text(
        text,
        style: TextStyle(color:Colors.black,
        fontSize: 20),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    
    final mealId=ModalRoute.of(context).settings.arguments as String;
    final selectedMeal=DUMMY_MEALS.firstWhere((meal)=>meal.id==mealId);
    return Scaffold(
      appBar: AppBar(
        title: Text('${selectedMeal.title}'),
      ),
          body:
          SingleChildScrollView(
                      child: Column(
                children: <Widget>[
                  Container(
                    height: 300, 
                    width:double.infinity,
                    child:Image.network(
                      selectedMeal.imageUrl,fit: BoxFit.cover),
            
                    ),
                    
                    buildSectionTitle(context,'Ingedients'),
                  buildContainer(
                    child: ListView.builder(
                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      itemBuilder: (ctx, index)=> 
                      Card(color: Colors.amber,
                      child: Text(selectedMeal.ingredients[index])
                      ),
                      itemCount: selectedMeal.ingredients.length,
                    ),
                  ),
                  buildSectionTitle(context, "Steps"),
                  buildContainer(
                    child: 
                    ListView.builder(itemBuilder: 
                    (ctx, index){
                      return Column(children:[
                                     ListTile(
                          leading :CircleAvatar(child: Text('# ${index +1}')),
                          title: Text(selectedMeal.steps[index],
                          style: TextStyle(color:Colors.black, fontFamily: 'Pacifico'),)
                         ),
                         Divider(),
                         ],
                      );
                    },
                    itemCount: selectedMeal.steps.length,),
                  ),
                ],
              ),
          ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.of(context).pop(mealId);
        },
        child:Icon(Icons.delete)),
    );
  }
  Widget buildContainer({Widget child}){
    return Container(
      child:child,
      decoration: BoxDecoration(
                      color:Colors.white10,
                      border: Border.all(color:Colors.grey),
                      borderRadius:BorderRadius.circular(10),
                    ),
                    padding: EdgeInsets.all(5),
                    height: 150,
                    width: 300,
                    
      );
  }
}