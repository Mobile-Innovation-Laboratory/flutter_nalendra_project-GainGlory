import 'package:flutter/material.dart';

class CustomBox extends StatelessWidget {
  final String title;
  final String description;
  final String photoUrl;

  const CustomBox({
    super.key,
    required this.title,
    required this.description,
    required this.photoUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.all(8),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (photoUrl.isNotEmpty)
              Image.network(photoUrl),
            SizedBox(height: 8),
            Text(
              title,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 4),
            Text(description),
          ],
        ),
      ),
    );
  }
}
