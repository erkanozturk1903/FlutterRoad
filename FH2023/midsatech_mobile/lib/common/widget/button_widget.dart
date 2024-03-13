import 'package:flutter/material.dart';
import 'package:midsatech_mobile/common/utils/app_colors.dart';
import 'package:midsatech_mobile/common/widget/app_shadow.dart';
import 'package:midsatech_mobile/common/widget/text_widgets.dart';


Widget appButton(
    {double width = 325,
      double height = 50,
      String buttonName = "",
      bool isLogin = true,
      BuildContext? context,
      VoidCallback? onTap,
    }) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      width: width,
      height: height,
      decoration: appBoxShadow(
          color: isLogin ? AppColors.primaryElement : Colors.white,
          border: Border.all(
            color: AppColors.primaryFourElementText,
          )),
      child: Center(
        child: text16Normal(
          text: buttonName,
          color: isLogin ? AppColors.primaryBackground : AppColors.primaryText,
        ),
      ),
    ),
  );
}
