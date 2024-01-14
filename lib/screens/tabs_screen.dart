import 'package:flutter/material.dart';
import 'package:meals_app/screens/category_screen.dart';
import 'package:meals_app/screens/favorites_screen.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({super.key});

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.pink,
          title: const Text(
            'Meals',
            style: TextStyle(color: Colors.white),
          ),
          bottom: const TabBar(tabs: [
            Tab(
              icon: Icon(
                Icons.category,
                color: Colors.white,
              ),
              child: Text(
                'Categories',
                style: TextStyle(color: Colors.white),
              ),
            ),
            Tab(
              icon: Icon(
                Icons.star,
                color: Colors.white,
              ),
              child: Text(
                'Favorites',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ]),
        ),
        body: const TabBarView(children: [
          CategoriesScreen(),
          FavoriteScreen(),
        ]),
      ),
    );
  }
}
