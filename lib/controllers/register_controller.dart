import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:project_gainglory/pages/home_page.dart';
import 'package:firebase_core/firebase_core.dart';

class RegisterController extends GetxController {
  var title = ''.obs;
  var description = ''.obs;
  var photoUrl = ''.obs;

  var username = ''.obs;
  var email = ''.obs;
  var password = ''.obs;
  var confirmPassword = ''.obs;
  var isLoading = false.obs;

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  void setUsername(String value) => username.value = value;
  void setEmail(String value) => email.value = value;
  void setPassword(String value) => password.value = value;
  void setConfirmPassword(String value) => confirmPassword.value = value;

  Future<bool> register() async {
    // Logic to handle content upload
    // Save title, description, and photoUrl to Firestore
    await _firestore.collection('content').add({
      'title': title.value,
      'description': description.value,
      'photoUrl': photoUrl.value,
      'createdAt': DateTime.now().toIso8601String(),
    });

    if (password.value != confirmPassword.value) {
      Get.snackbar('Error', 'Passwords do not match');
      return false;
    }

    isLoading.value = true; 
    try {
      
      await Firebase.initializeApp();

     
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email.value,
        password: password.value,
      );

      
      await _firestore.collection('users').doc(userCredential.user!.uid).set({
        'username': username.value,
        'email': email.value,
        'createdAt': DateTime.now().toIso8601String(),
      });

      Get.snackbar('Success', 'Registration successful');
      Get.offAll(() => HomePage()); 
      return true;
    } on FirebaseAuthException catch (e) {
      String errorMessage;
      switch (e.code) {
        case 'email-already-in-use':
          errorMessage = 'Email is already in use';
          break;
        case 'invalid-email':
          errorMessage = 'Invalid email format';
          break;
        case 'weak-password':
          errorMessage = 'Password is too weak';
          break;
        default:
          errorMessage = 'Registration failed: ${e.message}';
      }
      Get.snackbar('Error', errorMessage);
      return false;
    } finally {
      isLoading.value = false; 
    }
  }
}
