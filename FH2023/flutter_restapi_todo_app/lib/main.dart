import 'package:flutter/material.dart';
import 'package:flutter_restapi_todo_app/provider/auth/auth_provider.dart';
import 'package:flutter_restapi_todo_app/splash.dart';
import 'package:flutter_restapi_todo_app/styles/colors.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AuthProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          appBarTheme: AppBarTheme(
            color: primaryColor,
          ),
          primaryColor: primaryColor,
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
