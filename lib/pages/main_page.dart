import 'package:flutter/material.dart';
import 'package:trainapp/pages/home_page.dart';

class MainPage extends StatefulWidget {
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
    int _currentIndex = 0;
  final List<Widget> _screens = [
    HomePage(),
    Text("second page"),
    Text("third page"),
    Text("fourth page"),
    Text("fivth page"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
         type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items:  [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.location_city), label: 'Location'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
          BottomNavigationBarItem(icon: Icon(Icons.precision_manufacturing_outlined), label: 'Profile'),
        ],
      ),
    );
  }

}