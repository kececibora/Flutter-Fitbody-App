import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitbody_flutter/homepage/MyHomePage.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final email = ''.obs;
  final password = ''.obs;
  final errorMessage = ''.obs;
  final loading = false.obs;

  void submit() async {
    if (email.value.isEmpty || password.value.isEmpty) {
      errorMessage.value = 'Please enter a valid email and password';
      return;
    }
    loading.value = true;
    try {
      await loginWithFirebase();
      // navigate to the desired page
    } catch (e) {
      Get.snackbar("Başarısız!", "");
      print(e);
      loading.value = false;
    }
  }

  Future<void> loginWithFirebase() async {
    final authResult = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email.value, password: password.value);
    if (authResult.user == null) {
      throw Exception('An error occurred while trying to login');
    }
  }
}
