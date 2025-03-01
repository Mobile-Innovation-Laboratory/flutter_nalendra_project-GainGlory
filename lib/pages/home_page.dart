import 'dart:typed_data';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:file_picker/file_picker.dart';
import 'package:project_gainglory/controllers/content_controller.dart';
import 'package:project_gainglory/widgets/navigation_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ContentController contentController = Get.put(ContentController());
  int _currentIndex = 0;
  Uint8List? selectedImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home Page')),

      body: Obx(() {
        if (contentController.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (contentController.posts.isEmpty) {
          return const Center(child: Text("No posts available"));
        }

        return ListView.builder(
          itemCount: contentController.posts.length,
          itemBuilder: (context, index) {
            var post = contentController.posts[index];

            Uint8List? imageBytes;
            if (post['imageBase64'] != null && post['imageBase64'].isNotEmpty) {
              imageBytes = base64Decode(post['imageBase64']);
            }

            return Card(
              margin: const EdgeInsets.all(10),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      post['title'] ?? 'No Title',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(post['description'] ?? 'No Description'),
                    const SizedBox(height: 10),
                    if (imageBytes != null) Image.memory(imageBytes),
                  ],
                ),
              ),
            );
          },
        );
      }),

      bottomNavigationBar: CustomNavigationBar(currentIndex: _currentIndex),

      floatingActionButton: FloatingActionButton(
        onPressed: () => _showPostDialog(context),
        child: const Icon(Icons.add),
      ),
    );
  }

  void _showPostDialog(BuildContext context) {
    String title = '';
    String description = '';
    Uint8List? imageBytes;
    String base64Image = '';

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Upload Content'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration: const InputDecoration(labelText: 'Title'),
                onChanged: (value) => title = value,
              ),
              TextField(
                decoration: const InputDecoration(labelText: 'Description'),
                onChanged: (value) => description = value,
              ),
              TextButton(
                onPressed: () async {
                  FilePickerResult? result = await FilePicker.platform.pickFiles(
                    type: FileType.image,
                  );

                  if (result != null) {
                    imageBytes = result.files.first.bytes;
                    base64Image = base64Encode(imageBytes!);
                    setState(() {});
                  }
                },
                child: const Text('Select Image'),
              ),
              if (imageBytes != null) Image.memory(imageBytes!),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                contentController.addPost(title, description, base64Image);
                Navigator.of(context).pop();
              },
              child: const Text('Submit'),
            ),
          ],
        );
      },
    );
  }
}
