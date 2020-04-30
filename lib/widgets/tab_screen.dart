import 'package:flutter/material.dart';
import 'package:mealtime/category_screen.dart';
import 'package:mealtime/widgets/favourites_screen.dart';
import 'package:mealtime/widgets/main_drawer.dart';

class TabScreen extends StatefulWidget {
  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  
  List<Map<String, Object>> _pages=[
    {'page':CategoryScreen(), 'title':'Categories'},
    {'page':FavouritesScreen(), 'title' : 'Your Favourites'
    }];
  int _selectedPageIndex=0;

  void _selectPage(int index){
    setState(() {
      _selectedPageIndex=index;
    });  
  }
  

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        drawer: Drawer(
          child: MainDrawer(),
          elevation: 10,

        ),
        appBar: AppBar(
          title:Text('MyMeals-'+_pages[_selectedPageIndex]['title']),
          ),
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        selectedItemColor: Colors.white,
        selectedFontSize: 15,
        unselectedItemColor: Colors.white,
        unselectedFontSize: 10,
        elevation: 10,
        currentIndex: _selectedPageIndex,
        type: BottomNavigationBarType.fixed,
      backgroundColor: Theme.of(context).primaryColor,
      items: [

        BottomNavigationBarItem(
          backgroundColor: Colors.purple,
          icon: Icon(Icons.category),
        title: Text('Categories'),
        ),
        BottomNavigationBarItem(icon: Icon(Icons.star),
        title: Text('Favourites'),
        backgroundColor: Colors.purple,
        ),
      ],
      ),
    );
  }
}