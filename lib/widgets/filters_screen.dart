import 'package:flutter/material.dart';
import 'package:mealtime/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName='/filters';
  
  final Function saveFilters;
  final Map<String, bool> currentFilters;
  FiltersScreen(this.saveFilters, this.currentFilters);
  

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  
  bool _isGlutenFree = false;
  bool _isVegetarian = false;
  bool _isLactoseFree = false;
  bool _isVegan = false;
  Map<String, bool> _filters={
    'gluten':false,
    'lactose':false,
    'vegan':false,
    'vegetarian':false,
  };
  @override
  void initState() {
    _isGlutenFree=widget.currentFilters['gluten'];
    _isLactoseFree=widget.currentFilters['lactose'];
    _isVegan=widget.currentFilters['vegan'];
    _isVegetarian=widget.currentFilters['vegetarian'];
        super.initState();
  }
  
  
  @override
  Widget build(BuildContext context) {
    return 
    Scaffold(
        drawer: MainDrawer(),
        appBar: AppBar(
          title: Text('Filters'),),
        body: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(20),
              child: Text(
                'Adjust your Meal Selection',
                style: TextStyle(color:Colors.black,
                fontSize: 25,) ,
              ),
            ),
            Expanded(child: ListView(
              children: <Widget>[
                SwitchListTile(
                  title:Text('Gluten-Free',
                  style:TextStyle(
                    color:Colors.black
                  ),),
                  value:_isGlutenFree,
                  subtitle: Text('Only includes Gluten-free Meals'),

                  onChanged: (newValue){
                    setState(() {
                      _isGlutenFree=newValue;
                    });
                  },
                ),
                SwitchListTile(
                  title:Text('Vegetarian',
                  style:TextStyle(
                    color:Colors.black
                  ),),
                  value:_isVegetarian,
                  subtitle: Text('Only includes vegetarian Meals'),

                  onChanged: (newValue){
                    setState(() {
                      _isVegetarian=newValue;
                    });
                  },
                ),
                SwitchListTile(
                  title:Text('Vegan',
                  style:TextStyle(
                    color:Colors.black
                  ),),
                  value:_isVegan,
                  subtitle: Text('Only includes vegan Meals'),

                  onChanged: (newValue){
                    setState(() {
                      _isVegan=newValue;
                    });
                  },
                ),
                
                SwitchListTile(
                  title:Text('Lactose-Free',
                  style:TextStyle(
                    color:Colors.black
                  ),),
                  value:_isLactoseFree,
                  subtitle: Text('Only includes Lactose-free Meals'),

                  onChanged: (newValue){
                    setState(() {
                      _isLactoseFree=newValue;
                    });
                  },
                ),
                
              ],))
          ],
          
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: (){
            Map<String, bool> _selectedFilters={
            'gluten':_isGlutenFree,
            'lactose':_isLactoseFree,
            'vegan':_isVegan,
            'vegetarian':_isVegetarian,
            };
  
            widget.saveFilters(_selectedFilters);
            },
          child: Icon(Icons.save) ,)
    );
  }
}