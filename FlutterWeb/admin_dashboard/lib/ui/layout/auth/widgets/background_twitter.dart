import 'package:flutter/material.dart';

class BackgroundTwitter extends StatelessWidget {
  const BackgroundTwitter({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      //sdecoration: buildBoxDecoration(),
      child: Container(
        constraints: const BoxConstraints(maxWidth: 400),
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.0),
          child: Center(
            child: Image(
              image: AssetImage('signin.png'),
            ),
          ),
        ),
      ),
    );
  }

  BoxDecoration buildBoxDecoration() {
    return const BoxDecoration(
      image: DecorationImage(
        image: AssetImage('signin.png'),
        fit: BoxFit.cover,
      ),
    );
  }
}
