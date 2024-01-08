// ignore_for_file: sized_box_for_whitespace, no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';

enum FormStatus { signIn, register }

class EmailSignPage extends StatefulWidget {
  const EmailSignPage({super.key});

  @override
  State<EmailSignPage> createState() => _EmailSignPageState();
}

class _EmailSignPageState extends State<EmailSignPage> {
  FormStatus _formStatus = FormStatus.signIn;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _formStatus == FormStatus.signIn
            ? buildSignInForm()
            : buildRegisterForm(),
      ),
    );
  }

  Widget buildSignInForm() {
    final _signInFormKey = GlobalKey<FormState>();

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Form(
        key: _signInFormKey,
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
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Lütfen email adresinizi giriniz';
                } else if (!value.contains('@')) {
                  return 'Lütfen geçerli bir email adresi giriniz';
                }
                return null;
              },
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.email),
                hintText: 'Email',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            TextFormField(
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Lütfen şifrenizi giriniz';
                } else if (value.length < 6) {
                  return 'Şifreniz en az 6 karakter olmalıdır';
                }
                return null;
              },
              obscureText: true,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.lock),
                hintText: 'Password',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
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
            TextButton(
              onPressed: () {
                setState(() {
                  _formStatus = FormStatus.register;
                });
              },
              child: Text(
                'Üye Değil misin? Kayıt Ol',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.yellow.shade900,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildRegisterForm() {
    final _registerFormKey = GlobalKey<FormState>();

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Form(
        key: _registerFormKey,
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
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Lütfen email adresinizi giriniz';
                } else if (!value.contains('@')) {
                  return 'Lütfen geçerli bir email adresi giriniz';
                }
                return null;
              },
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.email),
                hintText: 'Email',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            TextFormField(
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Lütfen şifrenizi giriniz';
                } else if (value.length < 6) {
                  return 'Şifreniz en az 6 karakter olmalıdır';
                }
                return null;
              },
              obscureText: true,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.lock),
                hintText: 'Password',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            TextFormField(
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Lütfen şifrenizi giriniz';
                } else if (value.length < 6) {
                  return 'Şifreniz en az 6 karakter olmalıdır';
                }
                return null;
              },
              obscureText: true,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.lock),
                hintText: 'Re-Password',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
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
            TextButton(
              onPressed: () {
                setState(() {
                  _formStatus = FormStatus.signIn;
                });
              },
              child: Text(
                'Zaten Üye misin? Giriş Yap',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.yellow.shade900,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
