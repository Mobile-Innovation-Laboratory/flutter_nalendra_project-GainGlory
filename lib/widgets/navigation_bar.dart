import 'package:flutter/material.dart';

class CustomNavigationBar extends StatefulWidget {
  final int currentIndex; // Add currentIndex parameter

  const CustomNavigationBar({super.key, required this.currentIndex}); // Initialize currentIndex

  @override
  // ignore: library_private_types_in_public_api
  _CustomNavigationBarState createState() => _CustomNavigationBarState();
}

class _CustomNavigationBarState extends State<CustomNavigationBar> {
  final List<String> _routes = [
    '/home',
    '/search',
    '/workouts',
    '/rank',
    '/profile',
  ];

  void _onItemTapped(int index) {
    Navigator.pushReplacementNamed(context, _routes[index]);
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home, color: Colors.grey),
          activeIcon: Icon(Icons.home, color: Colors.white),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search, color: Colors.grey),
          activeIcon: Icon(Icons.search, color: Colors.white),
          label: 'Search',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.fitness_center, color: Colors.grey),
          activeIcon: Icon(Icons.fitness_center, color: Colors.white),
          label: 'Workouts',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.star, color: Colors.grey),
          activeIcon: Icon(Icons.star, color: Colors.white),
          label: 'Rank',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person, color: Colors.grey),
          activeIcon: Icon(Icons.person, color: Colors.white),
          label: 'Profile',
        ),
      ],
      currentIndex: widget.currentIndex, // Use the passed currentIndex
      backgroundColor: Colors.black,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.grey,
      showUnselectedLabels: true,
      onTap: _onItemTapped,
    );
  }
}
