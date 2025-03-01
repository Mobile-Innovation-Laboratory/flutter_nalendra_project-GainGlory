import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:project_gainglory/pages/login_page.dart';
import 'package:project_gainglory/pages/home_page.dart';

class LoginController extends GetxController {
  var email = ''.obs;
  var password = ''.obs;
  var isLoading = false.obs;
  var user = Rx<User?>(null);

  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void onInit() {
    super.onInit();
    user.value = _auth.currentUser;
    _auth.authStateChanges().listen((User? u) {
      user.value = u;
    });
  }

  void setEmail(String value) => email.value = value;
  void setPassword(String value) => password.value = value;

  Future<bool> login() async {
    isLoading.value = true;
    try {
      await _auth.signInWithEmailAndPassword(
        email: email.value,
        password: password.value,
      );
      Get.snackbar('Success', 'Login successful');
      Get.offAll(() => HomePage());
      return true;
    } on FirebaseAuthException catch (e) {
      String errorMessage;
      switch (e.code) {
        case 'user-not-found':
          errorMessage = 'User not found';
          break;
        case 'wrong-password':
          errorMessage = 'Incorrect password';
          break;
        case 'invalid-email':
          errorMessage = 'Invalid email format';
          break;
        default:
          errorMessage = 'Login failed: ${e.message}';
      }
      Get.snackbar('Error', errorMessage);
      return false;
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> logout() async {
    await _auth.signOut();
    Get.offAll(() => LoginPage());

    Get.snackbar('Success', 'Logged out');
  }
}
