import 'package:flutter/material.dart';
import 'package:project_gainglory/widgets/navigation_bar.dart'; 

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search Page'),
      ),
      body: Center(
        child: Text('Welcome to the Search Page!'),
      ),
      bottomNavigationBar: CustomNavigationBar(currentIndex: 1), // Set currentIndex to 1
    );
  }
}
