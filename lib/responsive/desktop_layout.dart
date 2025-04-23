import 'package:app_ban_giay/pages/home_page.dart';
import 'package:flutter/material.dart';
import '../pages/cart_page.dart';

class DesktopLayout extends StatefulWidget {
  DesktopLayout({super.key});

  @override
  State<DesktopLayout> createState() => _DesktopLayoutState();

  final List _pages = [
    HomePage(),
    CartPage(),
  ];

  int _selectedIndex = 0;

}

class _DesktopLayoutState extends State<DesktopLayout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget._pages[widget._selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: widget._selectedIndex,
          onTap: (index) {
            setState(() {
              widget._selectedIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              label: "Cart",
            )
          ]
      ),
    );
  }
}
