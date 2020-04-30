import 'package:flutter/material.dart';

import'./filters_screen.dart';
class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child:Column(
        children: <Widget>[
          Container(
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color:Theme.of(context).accentColor,
            child: Text('Cookin Up!',
            style: TextStyle(
              color: Colors.black,
              fontSize: 30,
              ),
            
            )
          ),
        SizedBox(
          height:20,
        )  
        ,
        ListTile(
          leading: Icon(Icons.restaurant,
          size:26,),
          title: Text('Meals',
          
          style: TextStyle(color:Colors.black,
          fontSize: 24),
          ),
          onTap: (){
            Navigator.of(context).pushReplacementNamed('/');
          },
        ),
        ListTile(
          leading: Icon(Icons.settings,
          size:26,),
          title: Text('Filters',
          
          style: TextStyle(color:Colors.black,
          fontSize: 24),
          ),
          onTap: (){
            Navigator.of(context).pushReplacementNamed(FiltersScreen.routeName);
          },
        ),
        
        
        ],
      )
    );
  }
}