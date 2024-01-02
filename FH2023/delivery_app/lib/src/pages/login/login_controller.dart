import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void goToRegisterPage() {
    Get.toNamed('/register');
  }

  void login() {
   String email = emailController.text.trim();
   String password = passwordController.text.trim();

   print('Email: $email');
   print('Password: $password');

   Get.snackbar('Email', email);
   Get.snackbar('Password', password);
   if(isValidForm(email, password)) {
     Get.snackbar('Login', 'Valid form');
   } else {
     Get.snackbar('Login', 'Invalid form');
   }
  }

  bool isValidForm(String email, String password) {
    if (email.isEmpty || !email.contains('@')) {
      Get.snackbar('Email', 'Invalid email');
      return false;
    } else if (password.isEmpty || password.length < 6) {
      Get.snackbar('Password', 'Invalid password');
      return false;
    }
    return true;
  }

}