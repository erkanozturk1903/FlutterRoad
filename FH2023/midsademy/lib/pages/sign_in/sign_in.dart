import 'package:flutter/material.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
     color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(

          ),
          backgroundColor: Colors.white,
          body: Center(
            child: Text("Sign in Page"),
          )
        ),
      ),
    );
  }
}
