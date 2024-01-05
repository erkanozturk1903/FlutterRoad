// ignore_for_file: prefer_const_constructors, dead_code, no_leading_underscores_for_local_identifiers, unnecessary_null_comparison

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_project/views/home_page.dart';
import 'package:flutter_firebase_project/views/sign_in_page.dart';

class OnBoardingWidget extends StatefulWidget {
  const OnBoardingWidget({super.key});

  @override
  State<OnBoardingWidget> createState() => _OnBoardingWidgetState();
}

class _OnBoardingWidgetState extends State<OnBoardingWidget> {
  bool? _isLogged;

  @override
  void initState() {
    FirebaseAuth.instance.authStateChanges().listen((user) {
      if (user == null) {
        _isLogged = false;
        print('User is currently signed out!');
      } else {
        print('User is signed in!');
        _isLogged = true;
      }

      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _isLogged == null
        ? Center(
            child: CircularProgressIndicator(),
          )
        : _isLogged == true
            ? HomePage()
            : SignInPage();
  }
}
