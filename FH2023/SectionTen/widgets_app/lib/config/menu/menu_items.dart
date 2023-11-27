import 'package:flutter/material.dart';

class MenuItem {
  final String title;
  final String subTitle;
  final String link;
  final IconData icon;

  const MenuItem({
    required this.title,
    required this.subTitle,
    required this.link,
    required this.icon,
  });
}

const appMenuItems = <MenuItem>[
  MenuItem(
    title: "Buton",
    subTitle: "Flutter Buton",
    link: "/buttons",
    icon: Icons.smart_button_outlined,
  ),
  MenuItem(
    title: "Kartlar",
    subTitle: "Kart Stilleri",
    link: "/cards",
    icon: Icons.credit_card,
  ),
];
