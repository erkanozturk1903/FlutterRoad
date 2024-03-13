import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:midsatech_mobile/pages/main/dashboard/human_grafic.dart';

class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Expanded(
        child: Column(
          children: [
            Container(
                height: 200,
                width: 300,
                child: DepartmanGrafik()),
          ],
        ),
      )
    );
  }
}