import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:midsademy/common/utils/app_colors.dart';
import 'package:midsademy/common/widgets/app_bar.dart';
import 'package:midsademy/common/widgets/app_shadow.dart';
import 'package:midsademy/common/widgets/text_widgets.dart';
import 'package:midsademy/pages/sign_in/widgets/sign_in_widgets.dart';
import 'package:midsademy/pages/sign_up/sign_up.dart';

Widget appButton(
    {double width = 325,
    double height = 50,
    String buttonName = "",
    bool isLogin = true,
    BuildContext? context,
    }) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
        context!,
        MaterialPageRoute(
          builder: (context) => SignUpPage()
        ),
      );
    },
    child: Container(
      width: width.w,
      height: height.h,
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
