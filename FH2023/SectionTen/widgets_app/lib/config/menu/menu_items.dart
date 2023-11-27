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
  MenuItem(
    title: "ProgressIndicator",
    subTitle: "Genel Kontroller",
    link: "/progress",
    icon: Icons.refresh_rounded,
  ),
  MenuItem(
    title: "SnackBar",
    subTitle: "Snackbar",
    link: "/snacksbar",
    icon: Icons.info_outline,
  ),
  MenuItem(
    title: "Animated Container",
    subTitle: "Stateful Widget Animasyon",
    link: "/animated",
    icon: Icons.check_box_outline_blank_rounded,
  ),
  MenuItem(
    title: "UI Controls",
    subTitle: "Stateful Widget Animasyon",
    link: "/ui-controls",
    icon: Icons.car_rental_outlined,
  ),
  MenuItem(
    title: "Uygulamaya Giriş",
    subTitle: "Uygulama Küçük Eğitim",
    link: "/tutorial",
    icon: Icons.car_rental_outlined,
  ),
];
