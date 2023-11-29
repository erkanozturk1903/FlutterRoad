import 'package:bases_web/ui/shared/custom_flat_button.dart';
import 'package:flutter/material.dart';

class CustomappMenu extends StatelessWidget {
  const CustomappMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      width: double.infinity,
      child: Row(
        children: [
          const SizedBox(
            width: 10,
          ),
          const SizedBox(
            width: 10,
          ),
        ],
      ),
    );
  }
}
