// ignore_for_file: override_on_non_overriding_member, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:riverpood_eticaret/constant/constant.dart';

class CustomAppbar extends StatelessWidget {
  @override
  final Size preferredSize;
  String appbarTitle;

  CustomAppbar({Key? key, this.appbarTitle = "iDrip"})
      : preferredSize = const Size.fromHeight(56.0),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        appbarTitle,
        style: const TextStyle(
          color: Constant.black,
          fontWeight: FontWeight.bold,
        ),
      ),
      leading: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SvgPicture.asset(
          "assets/icons/ic_drawer.svg",
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: SvgPicture.asset(
            "assets/icons/ic_search.svg",
          ),
        )
      ],
      backgroundColor: Constant.darkWhite,
    );
  }
}
