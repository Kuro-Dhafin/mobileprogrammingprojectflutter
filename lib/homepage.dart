// Import necessary packages
import 'package:flutter/material.dart';
import 'titled_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gym App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  final List<TitledPage> _pages = [
    HomePageContent(title: 'Home'),
    ProfilePage(title: 'Profile'),
    PlansPage(title: 'Plans'),
    RecipesPage(title: 'Recipes'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _pages[_currentIndex].title,
          style: TextStyle(fontFamily: 'YourCustomFont', fontSize: 24.0, fontWeight: FontWeight.bold),
        ),
      ),
      body: _pages[_currentIndex],
      backgroundColor: Colors.black, // Set background color to black
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Plans',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.restaurant_menu),
            label: 'Recipes',
          ),
        ],
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        backgroundColor: Colors.black, // Set bottom navigation bar background color
        elevation: 0, // Remove the shadow
        type: BottomNavigationBarType.fixed, // Ensure labels are visible for all items
      ),
    );
  }
}
