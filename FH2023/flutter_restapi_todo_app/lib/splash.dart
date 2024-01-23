// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_restapi_todo_app/screens/auth/login.dart';
import 'package:flutter_restapi_todo_app/utils/routers.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    navigate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FlutterLogo(),
      ),
    );
  }

  void navigate() async {
    await Future.delayed(const Duration(seconds: 3), () {
      PageNavigator(context: context).nextPageOnly(
        page: const LoginPage(),
      );
    });
  }
}
