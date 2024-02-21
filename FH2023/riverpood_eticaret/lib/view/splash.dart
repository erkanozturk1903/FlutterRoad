import 'package:flutter/material.dart';
import 'package:grock/grock.dart';
import 'package:riverpood_eticaret/constant/constant.dart';
import 'package:riverpood_eticaret/view/home.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2),(){
      Grock.toRemove(const Home());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constant.darkWhite,
      body: Center(
        child: Image.asset("assets/images/im_splash.png"),
      ),
    );
  }
}
