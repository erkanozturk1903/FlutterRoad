
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:midsatech_mobile/common/utils/app_colors.dart';
import 'package:midsatech_mobile/common/widget/text_widgets.dart';

AppBar buildAppbar() {
  return AppBar(
    backgroundColor: const Color(0xFF021734),
    foregroundColor: Colors.white,
    bottom: PreferredSize(
      preferredSize: const Size.fromHeight(1),
      child: Container(
        color: Colors.grey.withOpacity(0.5),
        height: 1,
      ),
    ),
    title: text16Normal(text: 'login'.tr, color: AppColors.primaryElementText),
  );
}
