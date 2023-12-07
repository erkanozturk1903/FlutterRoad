// ignore_for_file: avoid_unnecessary_containers

import 'package:admin_dashboard/ui/cards/white_card.dart';
import 'package:admin_dashboard/ui/label/custom_labels.dart';
import 'package:flutter/material.dart';

class BlankView extends StatelessWidget {
  const BlankView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        physics: const ClampingScrollPhysics(),
        children: [
          Text(
            "Blank View",
            style: CustomLabels.h1,
          ),
          const SizedBox(
            height: 10,
          ),
          const WhiteCard(
            title: "İstatistik",
            child: Text("Merhaba Dünya"),
          ),
        ],
      ),
    );
  }
}
