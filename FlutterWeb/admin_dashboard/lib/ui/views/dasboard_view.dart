// ignore_for_file: avoid_unnecessary_containers

import 'package:admin_dashboard/ui/label/custom_labels.dart';
import 'package:flutter/material.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        physics: const ClampingScrollPhysics(),
        children: [
          Text(
            "Dashboard View",
            style: CustomLabels.h1,
          ),
        ],
      ),
    );
  }
}
