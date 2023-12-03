import 'package:admin_dashboard/ui/shared/widgets/logo.dart';
import 'package:flutter/material.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280,
      height: double.infinity,
      decoration: buildBoxDecoration(),
      child: ListView(
        physics: const ClampingScrollPhysics(),
        children: [
          Logo(),
          SizedBox(
            height: 50,
          )
        ],
      ),
    );
  }

  BoxDecoration buildBoxDecoration() => const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xff092044),
            Color(0xff092042),
          ],
        ),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 10),
        ],
      );
}
