import 'package:flutter/material.dart';
import 'package:midsademy/common/utils/app_colors.dart';
import 'package:midsademy/common/widgets/text_widgets.dart';

AppBar buildAppbar() {
  return AppBar(
    backgroundColor: Colors.white,
    foregroundColor: Colors.white,
    bottom: PreferredSize(
      preferredSize: const Size.fromHeight(1),
      child: Container(
        color: Colors.grey.withOpacity(0.5),
        height: 1,
      ),
    ),
    title: text16Normal(text: 'Login', color: AppColors.primaryText),
  );
}
