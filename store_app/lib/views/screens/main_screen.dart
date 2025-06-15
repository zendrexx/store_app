import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:store_app/views/screens/nav_screens/cart_screen.dart';
import 'package:store_app/views/screens/nav_screens/favorite_screen.dart';
import 'package:store_app/views/screens/nav_screens/home_screen.dart';
import 'package:store_app/views/screens/nav_screens/profile_Screen.dart';
import 'package:store_app/views/screens/nav_screens/stores_screen.dart';

class MainScreen extends StatefulWidget {
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _pageIndex = 0;
  final List<Widget> _pages = [
    HomeScreen(),
    FavoriteScreen(),
    StoresScreen(),
    CartScreen(),
    ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _pageIndex,
        onTap: (index) {
          setState(() {
            _pageIndex = index;
          });
        },
        selectedItemColor: Colors.purple,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(
            icon: Image.asset("assets/icons/home.png", width: 25),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Image.asset("assets/icons/love.png", width: 25),
            label: "Favorite",
          ),
          BottomNavigationBarItem(
            icon: Image.asset("assets/icons/mart.png", width: 25),
            label: "Stores",
          ),
          BottomNavigationBarItem(
            icon: Image.asset("assets/icons/cart.png", width: 25),
            label: "Cart",
          ),
          BottomNavigationBarItem(
            icon: Image.asset("assets/icons/user.png", width: 25),
            label: "Profile",
          ),
        ],
      ),
      body: _pages[_pageIndex],
    );
  }
}
