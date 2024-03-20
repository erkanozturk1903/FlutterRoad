// ignore_for_file: unused_field, use_build_context_synchronously, must_be_immutable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:midsatech_mobile/common/widget/app_bar.dart';
import 'package:midsatech_mobile/common/widget/button_widget.dart';
import 'package:midsatech_mobile/common/widget/text_widgets.dart';
import 'package:midsatech_mobile/pages/auth/login_screen.dart';
import 'package:midsatech_mobile/pages/auth/widgets/app_textfields.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({super.key});
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  late String _uid;

  void _register(BuildContext context) async {
    final String username = _usernameController.text.trim();
    final String email = _emailController.text.trim();
    final String password = _passwordController.text;
    final String confirmPassword = _confirmPasswordController.text;

    if (password != confirmPassword) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Passwords do not match'),
        ),
      );
      return;
    }

    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      _uid = FirebaseAuth.instance.currentUser!.uid;
      // User oluşturuldu, şimdi veritabanına kaydet
      await _firestore
          .collection('midsatech')
          .doc('customers')
          .collection('users')
          .doc(_uid)
          .set({
        'username': username,
        'email': email,
        'password': password, // Şifreleri açık metin olarak saklamaktan kaçının
        'roles': '',
        'profilePictureUrl': '',
        'address': '',
        'phoneNumber': '',
        'position': '',
        'profession': '',
        'specialties': '',
        'cid': _uid,
      });

      // Kayıt işlemi başarılı, ana sayfaya yönlendir
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const LoginScreen(),
        ),
      );
    } catch (e) {
      // Hata durumunda kullanıcıya bilgi ver
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('An error occurred during registration: $e'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppbar(),
      backgroundColor: const Color(0xFF021734),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            //TODO: More Login options
            Center(
              child: text14Normal(
                  text: "Enter your details to below & free sign up"),
            ),
            const SizedBox(height: 15),
            appTextField(
              text: "Username",
              iconName: "assets/icons/user.png",
              hintText: "Enter your username",
              controller: _usernameController,
            ),
            const SizedBox(height: 20),
            //TODO: Email fields
            appTextField(
              text: "Email",
              iconName: "assets/icons/user.png",
              hintText: "Enter your email",
              controller: _emailController,
            ),
            const SizedBox(height: 20),
            //TODO: Password fields
            appTextField(
                text: "Password",
                iconName: "assets/icons/lock.png",
                hintText: "Enter your password",
                controller: _passwordController,
                obscureText: true),
            const SizedBox(height: 10),
            appTextField(
                text: "Confirm Password",
                iconName: "assets/icons/lock.png",
                hintText: "Enter your confirm password",
                controller: _confirmPasswordController,
                obscureText: true),

            const SizedBox(height: 60),
            //TODO: Register button
            Center(
              child: appButton(
                buttonName: "Register",
                context: context,
                isLogin: true,
                onTap: () {
                  _register(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
