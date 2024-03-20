// ignore_for_file: prefer_final_fields

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:midsatech_mobile/common/widget/button_widget.dart';
import 'package:midsatech_mobile/common/widget/text_widgets.dart';
import 'package:midsatech_mobile/pages/auth/register.dart';
import 'package:midsatech_mobile/pages/auth/widgets/app_textfields.dart';
import 'package:midsatech_mobile/pages/auth/widgets/sign_in_widgets.dart';
import 'package:midsatech_mobile/pages/main/home.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _login(BuildContext context) async {
    final String email = _emailController.text
        .trim(); // Email için TextEditingController tanımlamanız gerekir
    final String password = _passwordController
        .text; // Şifre için TextEditingController tanımlamanız gerekir
    final FirebaseAuth _auth = FirebaseAuth.instance;

    try {
      // Kullanıcı girişi
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      // Giriş başarılı, ana sayfaya yönlendir
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const HomePage(),
        ),
      );
    } catch (e) {
      // Hata durumunda kullanıcıya bilgi ver
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Login failed: $e'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFF021734),
        body: SafeArea(
            child: SingleChildScrollView(
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: SizedBox(
                  height: 120,
                  width: 120,
                  child: Image.asset(
                    'assets/app_logo.jpeg',
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Center(
                child: Text(
                  ' Midsatech-W',
                  style: TextStyle(
                      color: Colors.deepOrange.shade400,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
              thirdPartyLogin(),
              const SizedBox(
                height: 5,
              ),
              Center(
                child: text14Normal(text: 'Or use your email account to login'),
              ),
              const SizedBox(height: 15),
              appTextField(
                controller: _emailController,
                text: "Email",
                iconName: "assets/icons/user.png",
                hintText: "Enter your email",
              ),
              const SizedBox(height: 20),
              //TODO: Password fields
              appTextField(
                  controller: _passwordController,
                  text: "Password",
                  iconName: "assets/icons/lock.png",
                  hintText: "Enter your password",
                  obscureText: true),
              const SizedBox(height: 10),
              Container(
                child: textUnderline(
                  text: "Forgot Password?",
                ),
              ),
              const SizedBox(height: 40),
              //TODO: Login button

              Center(
                child: appButton(
                    buttonName: "Login",
                    onTap: () {
                      _login(context);
                    }),
              ),

              const SizedBox(height: 10),
              //TODO: Sign up button
              Center(
                child: appButton(
                    buttonName: "Register",
                    isLogin: false,
                    context: context,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SignUpPage(),
                        ),
                      );
                    }),
              ),
            ],
          ),
        )));
  }
}
