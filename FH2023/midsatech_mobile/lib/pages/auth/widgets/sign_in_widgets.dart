// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';

Widget thirdPartyLogin() {
  return Container(
    margin: const EdgeInsets.only(left: 80, right: 88, top: 40, bottom: 20),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _loginButton('assets/icons/google.png'),
        _loginButton('assets/icons/apple.png'),
        _loginButton('assets/icons/facebook.png'),
      ],
    ),
  );
}

Widget _loginButton(String imagePath) {
  return GestureDetector(
    onTap: () {},
    child: Container(
      width: 50,
      height: 50,
      child: Image.asset(imagePath),
    ),
  );
}
