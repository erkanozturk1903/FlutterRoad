import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grock/grock.dart';
import 'package:riverpood_eticaret/constant/constant.dart';
import 'package:riverpood_eticaret/view/splash.dart';

void main() => runApp(
      ProviderScope(
        child: MyApp(),
      ),
    );

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Riverpood E-Ticaret',
        debugShowCheckedModeBanner: false,
        navigatorKey: Grock.navigationKey,
        scaffoldMessengerKey: Grock.scaffoldMessengerKey,
        theme: ThemeData(
          scaffoldBackgroundColor: Constant.white
        ),
        home: Splash());
  }
}
