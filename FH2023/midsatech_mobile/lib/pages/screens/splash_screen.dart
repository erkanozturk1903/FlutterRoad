import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:midsatech_mobile/common/utils/app_routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 2000),
        () => Get.offAllNamed(RouteHelper.getLoginRoute()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFF021734),
        body: Center(
          child: Image.asset(
            'assets/splash.png',
            fit: BoxFit.contain,
          ),
        ));
  }
}
