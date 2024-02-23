// ignore_for_file: prefer_const_constructors, use_build_context_synchronously

import 'package:deneme_test_api/home_page.dart';
import 'package:deneme_test_api/service/user_service.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController pKullaniciAdi = TextEditingController();
  TextEditingController pSifre = TextEditingController();
  final service = UserService();

  void girisYap() async {
    var user = await service.fetchUser(pKullaniciAdi.text, pSifre.text);
    if (user != null) {
      print('Giriş Başarılı');
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => HomePage(),
        ),
      );
    } else {
      print('Giriş Başarısız');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                controller: pKullaniciAdi,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Username',
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                controller: pSifre,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: girisYap,
                child: Text('Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
