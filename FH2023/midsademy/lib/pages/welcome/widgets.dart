import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:midsademy/common/widgets/app_shadow.dart';
import 'package:midsademy/common/widgets/text_widgets.dart';
import 'package:midsademy/pages/sign_in/sign_in.dart';

Widget appOnboardingPage(
  PageController controller, {
  String imagePath = "assets/images/reading.png",
  String title = "",
  String subTitle = "",
  int index = 1,
  required BuildContext context,
}) {
  return Column(
    children: [
      Image.asset(
        imagePath,
        fit: BoxFit.fitWidth,
      ),
      Container(
        margin: const EdgeInsets.only(top: 15),
        child: text24Normal(text: title),
      ),
      Container(
        margin: const EdgeInsets.only(top: 15),
        padding: const EdgeInsets.only(left: 30, right: 30),
        child: text16Normal(
          text: subTitle,
        ),
      ),
      _nextButton(index, controller, context),
    ],
  );
}

Widget _nextButton(int index, PageController controller, BuildContext context) {
  return GestureDetector(
    onTap: () {
      if (index < 3) {
        controller.animateToPage(
          index,
          duration: const Duration(milliseconds: 300),
          curve: Curves.linear,
        );
      } else {
        Navigator.pushNamed(context, "/signIn");
        /*Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>const SignInPage(),
          ),
        );*/
      }
    },
    child: Container(
        margin: const EdgeInsets.only(top: 100, left: 25, right: 25),
        width: 325,
        height: 50,
        decoration: appBoxShadow(),
        child: Center(
          child: text16Normal(
            text: "Next",
            color: Colors.white,
          ),
        )),
  );
}
