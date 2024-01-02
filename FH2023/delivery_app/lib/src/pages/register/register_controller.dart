import 'package:delivery_app/src/models/user.dart';
import 'package:delivery_app/src/providers/users_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  UsersProvider usersProvider = UsersProvider();

  void register() async {
    String email = emailController.text.trim();
    String name = nameController.text.trim();
    String lastname = lastnameController.text.trim();
    String phone = phoneController.text.trim();
    String password = passwordController.text.trim();
    String confirmPassword = confirmPasswordController.text.trim();

    print('Email: $email');
    print('Password: $password');

    Get.snackbar('Email', email);
    Get.snackbar('Password', password);

    if (isValidForm(email, name, lastname, phone, password, confirmPassword)) {
      User user = User(
          email: email,
          name: name,
          lastname: lastname,
          phone: phone,
          password: password);
      Response response = await usersProvider.create(user);

      print('RESPONSE: ${response.body}');

      Get.snackbar('Register', 'Valid form');
    } else {
      Get.snackbar('Register', 'Invalid form');
    }
  }

  bool isValidForm(String email, String name, String lastname, String phone,
      String password, String confirmPassword) {
    if (email.isEmpty || !email.contains('@')) {
      Get.snackbar('Form', 'Invalid email');
      return false;
    }
    if (name.isEmpty) {
      Get.snackbar('Form', 'Name cannot be empty');
      return false;
    }
    if (lastname.isEmpty) {
      Get.snackbar('Form', 'Last Name cannot be empty');
      return false;
    }
    if (phone.isEmpty) {
      Get.snackbar('Form', 'Phone cannot be empty');
      return false;
    }
    if (password.isEmpty || password.length < 6) {
      Get.snackbar('Form', 'Password cannot be empty');
      return false;
    }
    if (confirmPassword.isEmpty || confirmPassword != password) {
      Get.snackbar('Form', 'Password  meeting');
      return false;
    }
    return true;
  }
}
