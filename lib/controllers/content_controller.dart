import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';

class ContentController extends GetxController {
  var posts = [].obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    fetchPosts();
    super.onInit();
  }

  void fetchPosts() async {
    try {
      isLoading(true);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? postsString = prefs.getString('posts');
      if (postsString != null) {
        List<dynamic> postsList = json.decode(postsString);
        posts.assignAll(postsList);
      }
    } catch (e) {
      print("❌ Error fetching posts: $e");
    } finally {
      isLoading(false);
    }
  }

  void addPost(String title, String description, String base64Image) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      List<dynamic> currentPosts = posts.toList();

      currentPosts.add({
        "title": title,
        "description": description,
        "imageBase64": base64Image, // Simpan dalam Base64
        "timestamp": DateTime.now().toString(),
      });

      await prefs.setString('posts', json.encode(currentPosts));
      posts.assignAll(currentPosts);
    } catch (e) {
      print("❌ Error adding post: $e");
    }
  }
}
