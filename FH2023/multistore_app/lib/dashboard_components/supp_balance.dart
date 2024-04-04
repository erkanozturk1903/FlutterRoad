import 'package:flutter/material.dart';
import 'package:multistore_app/widget/appbar_widget.dart';

class SuppliersBalance extends StatelessWidget {
  const SuppliersBalance({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const AppBartitle(
          title: "Suppliers Balance",
        ),
        leading: const AppBarBackButton(),
      ),
    );
  }
}
