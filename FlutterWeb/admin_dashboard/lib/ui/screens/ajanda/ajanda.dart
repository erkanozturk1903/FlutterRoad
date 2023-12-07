import 'package:admin_dashboard/ui/label/custom_labels.dart';
import 'package:flutter/material.dart';

class AjandaScreen extends StatelessWidget {
  const AjandaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        physics: const ClampingScrollPhysics(),
        children: [
          Text(
            "Ajanda View",
            style: CustomLabels.h1,
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
