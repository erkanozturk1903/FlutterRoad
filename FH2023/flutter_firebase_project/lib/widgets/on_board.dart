// ignore_for_file: prefer_const_constructors, dead_code, no_leading_underscores_for_local_identifiers, unnecessary_null_comparison

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_project/services/auth.dart';
import 'package:flutter_firebase_project/views/home_page.dart';
import 'package:flutter_firebase_project/views/sign_in_page.dart';

import 'package:provider/provider.dart';

class OnBoardingWidget extends StatefulWidget {
  const OnBoardingWidget({super.key});

  @override
  State<OnBoardingWidget> createState() => _OnBoardingWidgetState();
}

class _OnBoardingWidgetState extends State<OnBoardingWidget> {
  @override
  Widget build(BuildContext context) {
    final _auth = Provider.of<Auth>(context, listen: false);
    return StreamBuilder<User?>(
        stream: _auth.authStatusChanges(),
        builder: (_, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            final user = snapshot.data;
            return user != null ? const HomePage() : const SignInPage();
          }
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        });
  }
}
