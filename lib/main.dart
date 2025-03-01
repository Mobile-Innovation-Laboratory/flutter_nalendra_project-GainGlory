import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:project_gainglory/pages/home_page.dart';
import 'package:project_gainglory/pages/search_page.dart';
import 'package:project_gainglory/pages/workouts_page.dart';
import 'package:project_gainglory/pages/rank_page.dart';
import 'package:project_gainglory/pages/profile_page.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Gym App',
      home: HomePage(), // Directly to Home page
      getPages: [
        GetPage(name: '/home', page: () => HomePage()),
        GetPage(name: '/search', page: () => SearchPage()),
        GetPage(name: '/workouts', page: () => WorkoutsPage()),
        GetPage(name: '/rank', page: () => RankPage()),
        GetPage(name: '/profile', page: () => ProfilePage()),
      ],
    );
  }
}
