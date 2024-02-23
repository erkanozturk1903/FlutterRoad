import 'package:deneme_test_api/model/user_model.dart';
import 'package:deneme_test_api/service/user_service.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  UserService service = UserService();
  UserModel users = UserModel();

  @override
  void initState() {
    super.initState();
    service.fetchUser('pKullaniciAdi', 'pSifre').then((value) {
      if (value != null && value.oOUT == '999') {
        setState(() {
          users = value;
        });
      }
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Center(
          child: ListTile(
        title: Text(userModelToJson(users.oAdSoyad.toString())),
      )),
    );
  }
}
