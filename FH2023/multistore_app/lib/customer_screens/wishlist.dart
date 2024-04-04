import 'package:flutter/material.dart';
import 'package:multistore_app/widget/appbar_widget.dart';

class Wishlist extends StatelessWidget {
  const Wishlist({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const AppBartitle(
          title: "Wishlist",
        ),
        leading: const AppBarBackButton(),
      ),
    );
  }
}
