import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_gainglory/controllers/login_controller.dart';
import 'package:project_gainglory/pages/register_page.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final LoginController controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login Page')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              decoration: const InputDecoration(labelText: 'Email'),
              onChanged: controller.setEmail,
            ),
            const SizedBox(height: 10),
            TextField(
              decoration: const InputDecoration(labelText: 'Password'),
              obscureText: true,
              onChanged: controller.setPassword,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                await controller.login();
              },
              child: const Text('Login'),
            ),
            const SizedBox(height: 20),
            TextButton(
              onPressed: () {
                Get.to(() => RegisterPage());
              },
              child: const Text("Don't have an account? Register now"),
            ),
          ],
        ),
      ),
    );
  }
}
