import 'package:flutter/material.dart';

class LoginFormProvider extends ChangeNotifier {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';

  bool validateForm() {
    if (formKey.currentState!.validate()) {
      /*  print('Form valid...Login');
      print('$email === $password'); */
      return true;
    } else {
      // print('Form Not valid');
      return false;
    }
  }
}
