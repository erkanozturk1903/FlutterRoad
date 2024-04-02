import 'package:flutter/material.dart';

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
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          color: Colors.black,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          subcategName,
          style: const TextStyle(color: Colors.black),
        ),
      ),
      body: Center(
        child: Text(maincategName),
      ),
    );
  }
}
