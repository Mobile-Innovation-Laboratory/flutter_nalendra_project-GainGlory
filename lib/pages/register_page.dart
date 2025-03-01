import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart'; 
import '../widgets/custom_button.dart';
import '../controllers/register_controller.dart';
import 'login_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool isPasswordVisible = false;
  bool isConfirmPasswordVisible = false;

  final RegisterController registerController = Get.put(RegisterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'JOIN US NOW.',
          style: GoogleFonts.kanit(fontSize: 40, fontWeight: FontWeight.bold),
        ),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "Create a GainGlory account and start your glorious journey today.",
              style: GoogleFonts.kanit(fontSize: 16, color: Colors.black),
              textAlign: TextAlign.left,
            ),
            const SizedBox(height: 30),

            _buildTextField('Username', onChanged: registerController.setUsername),
            const SizedBox(height: 16),

            _buildTextField('Email', onChanged: registerController.setEmail),
            const SizedBox(height: 16),

            _buildTextField(
              'Password',
              obscureText: !isPasswordVisible,
              suffixIcon: IconButton(
                icon: Icon(
                  isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                ),
                onPressed: () {
                  setState(() {
                    isPasswordVisible = !isPasswordVisible;
                  });
                },
              ),
              onChanged: registerController.setPassword,
            ),
            const SizedBox(height: 16),

            _buildTextField(
              'Confirm Password',
              obscureText: !isConfirmPasswordVisible,
              suffixIcon: IconButton(
                icon: Icon(
                  isConfirmPasswordVisible ? Icons.visibility : Icons.visibility_off,
                ),
                onPressed: () {
                  setState(() {
                    isConfirmPasswordVisible = !isConfirmPasswordVisible;
                  });
                },
              ),
              onChanged: registerController.setConfirmPassword,
            ),
            const SizedBox(height: 20),

            Obx(() {
              return registerController.isLoading.value
                  ? const CircularProgressIndicator() 
                  : CustomButton(
                      text: 'Register',
                      textStyle: GoogleFonts.kanit(color: Colors.white),
                      onPressed: () async {
                        bool success = await registerController.register();
                        if (success) {
                          Get.offAll(() => LoginPage()); 
                        }
                      },
                    );
            }),
            const SizedBox(height: 20),

            GestureDetector(
              onTap: () {
                Get.to(() => LoginPage()); 
              },
              child: Text(
                "Already have an account? Login instead.",
                style: GoogleFonts.kanit(color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(
    String label, {
    bool obscureText = false,
    Widget? suffixIcon,
    required Function(String) onChanged,
  }) {
    return TextField(
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: label,
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.zero,
          borderSide: const BorderSide(color: Colors.grey),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.zero,
          borderSide: const BorderSide(color: Colors.black, width: 2),
        ),
        suffixIcon: suffixIcon,
      ),
      onChanged: onChanged,
    );
  }
}
