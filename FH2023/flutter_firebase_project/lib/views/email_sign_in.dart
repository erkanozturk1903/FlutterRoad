// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';

class EmailSignPage extends StatefulWidget {
  const EmailSignPage({super.key});

  @override
  State<EmailSignPage> createState() => _EmailSignPageState();
}

class _EmailSignPageState extends State<EmailSignPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: buildSignInForm(),
    ));
  }

  Widget buildSignInForm() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Form(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Lütfen Giriş Yapınız',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'Email',
              ),
            ),
            const SizedBox(height: 10),
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'Şifre',
              ),
            ),
            const SizedBox(height: 20),
            Container(
              width: double.infinity,
              height: 60,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.yellow.shade900,
                  foregroundColor: Colors.white,
                ),
                child: const Text(
                  'Giriş Yap',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildRegisterForm() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Form(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Kayıt Formu',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'Email',
              ),
            ),
            const SizedBox(height: 10),
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'Şifre',
              ),
            ),
            const SizedBox(height: 10),
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'Şifre',
              ),
            ),
            const SizedBox(height: 20),
            Container(
              width: double.infinity,
              height: 60,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.yellow.shade900,
                  foregroundColor: Colors.white,
                ),
                child: const Text(
                  'Kayıt Ol',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
