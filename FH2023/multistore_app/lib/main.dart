import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:multistore_app/auth/customer_login.dart';
import 'package:multistore_app/auth/customer_signup.dart';
import 'package:multistore_app/auth/supplier_login.dart';
import 'package:multistore_app/auth/supplier_signup.dart';
import 'package:multistore_app/categories/welcome_screen.dart';
import 'package:multistore_app/firebase_options.dart';
import 'package:multistore_app/main_screens/customer_home.dart';
import 'package:multistore_app/main_screens/supplier_home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //home: const WelcomeScreen(),
      initialRoute: '/welcome_screen',
      routes: {
        '/welcome_screen': (context) => const WelcomeScreen(),
        '/customer_home': (context) => const CustomerHomeScreen(),
        '/supplier_home': (context) => const SupplierHomeScreen(),
        '/customer_signup_screen': (context) => const CustomerRegister(),
        '/customer_login_screen': (context) => const CustomerLogin(),
        '/supplier_signup_screen': (context) => const SupplierRegister(),
        '/suppliers_login_screen': (context) => const SupplierLogin(),
      },
    );
  }
}
