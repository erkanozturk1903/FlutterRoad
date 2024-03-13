import 'package:flutter/material.dart';
import 'package:midsatech_mobile/common/utils/app_colors.dart';

Widget text24Normal({
  String text = "",
  Color color = AppColors.primaryText,
}) {
  return Text(
    text,
    textAlign: TextAlign.center,
    style: TextStyle(
      color: color,
      fontSize: 24,
      fontWeight: FontWeight.normal,
    ),
  );
}

Widget text16Normal({
  String text = "",
  Color color = AppColors.primarySecondaryElementText,
}) {
  return Text(
    text,
    textAlign: TextAlign.center,
    style:  TextStyle(
      color: color,
      fontSize: 16,
      fontWeight: FontWeight.normal,
    ),
  );
}


Widget text14Normal({
  String text = "",
  Color color = AppColors.primaryThreeElementText,
}) {
  return Text(
    text,
    textAlign: TextAlign.start,
    style:  TextStyle(
      color: color,
      fontSize: 14,
      fontWeight: FontWeight.normal,
    ),
  );
}

Widget textUnderline({String text = "Your text"}) {
  return GestureDetector(
    onTap: () {},
    child: Text(
      text,
      style:const TextStyle(

        fontWeight: FontWeight.normal,
        fontSize: 12,
        color: AppColors.primaryElementText,
        decoration: TextDecoration.underline,
        decorationColor: AppColors.primaryText,
      ),
    ),
  );
}