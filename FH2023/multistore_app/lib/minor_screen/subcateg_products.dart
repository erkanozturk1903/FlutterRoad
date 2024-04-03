import 'package:flutter/material.dart';
import 'package:multistore_app/widget/appbar_widget.dart';

class SubCategProduct extends StatelessWidget {
  final String subcategName;
  final String maincategName;
  const SubCategProduct({
    super.key,
    required this.subcategName,
    required this.maincategName,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: const AppBarBackButton(),
        title: AppBartitle(title: subcategName),
      ),
      body: Center(
        child: Text(maincategName),
      ),
    );
  }
}
