import 'package:flutter/material.dart';
import 'package:midsademy/common/utils/app_colors.dart';

BoxDecoration appBoxShadow({
  Color color = AppColors.primaryElement,
  double radius = 15,
  sR = 1.0,
  bR = 2.0,
  BoxBorder? border,
}) {
  return BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(radius),
      border: border,
      boxShadow: [
        BoxShadow(
          color: Colors.red.withOpacity(0.1),
          spreadRadius: sR,
          blurRadius: bR,
          offset: const Offset(0, 1), // changes position of shadow
        )
      ]);
}

BoxDecoration appBoxDecorationTextField({
  Color color = AppColors.primaryBackground,
  double radius = 15,
  Color borderColor = AppColors.primaryFourElementText,
}) {
  return BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(radius),
      border: Border.all(
        color: borderColor
      ),
      );
}
