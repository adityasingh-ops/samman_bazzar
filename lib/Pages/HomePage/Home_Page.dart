import 'package:flutter/material.dart';
import 'package:samman_bazzar/Pages/HomePage/main_food_page.dart';
import 'package:samman_bazzar/tools/colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _selectedpage = 0;
  List pages = [
    const MainItemPage(),
    Container(
      color: Colors.red,
    ),
    Container(
      color: Colors.blue,
    ),
    Container(
      color: Colors.green,
    ),
    Container(
      color: Colors.red,
    ),
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedpage = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:pages[_selectedpage],

      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: AppColors.mainColor,
        unselectedItemColor: Colors.amberAccent,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        onTap: _onItemTapped,
        selectedFontSize: 0.0,
        unselectedFontSize: 0.0,
        currentIndex: _selectedpage,
        items: [
          BottomNavigationBarItem(
          
            icon: Icon(Icons.home_outlined),
            label: "Home",
          ),
           BottomNavigationBarItem(
            icon: Icon(Icons.archive),
            label: "History",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: "Cart",
          ),
         
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          ),
        ],
        ),
    );
  }
}