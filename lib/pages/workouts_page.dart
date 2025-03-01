import 'package:flutter/material.dart';
import 'package:project_gainglory/widgets/navigation_bar.dart'; 

class WorkoutsPage extends StatelessWidget {
  const WorkoutsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Workouts Page'),
      ),
      body: Center(
        child: Text('Welcome to the Workouts Page!'),
      ),
      bottomNavigationBar: CustomNavigationBar(currentIndex: 2), // Set currentIndex to 2
    );
  }
}
