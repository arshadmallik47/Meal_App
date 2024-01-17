// ignore_for_file: unused_field, unused_element

import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screens/category_screen.dart';
import 'package:meals_app/screens/favorites_screen.dart';
import 'package:meals_app/widgets/main_drawer.dart';

class TabScreen extends StatefulWidget {
  final List<Meal> favoriteMeals;
  const TabScreen(this.favoriteMeals, {super.key});

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  late List<Map<String, dynamic>> _pages;
  int _selectedPageIndex = 0;

  @override
  void initState() {
    _pages = [
      {'page': const CategoriesScreen(), 'title': 'Categories'},
      {'page': FavoriteScreen(widget.favoriteMeals), 'title': 'Your Favorites'},
    ];
    super.initState();
  }

  void _selectPage(int index) {
    setState(
      () {
        _selectedPageIndex = index;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: Text(
          _pages[_selectedPageIndex]['title'],
          style: const TextStyle(color: Colors.white),
        ),
        // bottom: const TabBar(tabs: [
        //   Tab(
        //     icon: Icon(
        //       Icons.category,
        //       color: Colors.white,
        //     ),
        //     child: Text(
        //       'Categories',
        //       style: TextStyle(color: Colors.white),
        //     ),
        //   ),
        //   Tab(
        //     icon: Icon(
        //       Icons.star,
        //       color: Colors.white,
        //     ),
        //     child: Text(
        //       'Favorites',
        //       style: TextStyle(color: Colors.white),
        //     ),
        //   ),
        // ]),
      ),
      drawer: const MainDrawer(),
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.yellow,
        currentIndex: _selectedPageIndex,
        type: BottomNavigationBarType.shifting,
        onTap: _selectPage,
        items: const [
          BottomNavigationBarItem(
            backgroundColor: Colors.pink,
            icon: Icon(Icons.category),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.pink,
            icon: Icon(Icons.star),
            label: 'Favorites',
          )
        ],
        backgroundColor: Colors.pink,
      ),
    );
  }
}
