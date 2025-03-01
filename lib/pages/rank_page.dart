import 'package:flutter/material.dart';
import 'package:project_gainglory/widgets/navigation_bar.dart'; 

class RankPage extends StatelessWidget {
  const RankPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Rank Page')),
      body: Center(child: Text('Welcome to the Rank Page!')),
      bottomNavigationBar: CustomNavigationBar(currentIndex: 3), // Set currentIndex to 3
    );
  }
}
