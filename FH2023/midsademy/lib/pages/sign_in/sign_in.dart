import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:midsademy/common/widgets/app_bar.dart';
import 'package:midsademy/common/widgets/button_widgets.dart';
import 'package:midsademy/common/widgets/text_widgets.dart';
import 'package:midsademy/pages/sign_in/widgets/app_textfields.dart';
import 'package:midsademy/pages/sign_in/widgets/sign_in_widgets.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
            appBar: buildAppbar(),
            backgroundColor: Colors.white,
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //TODO: Top login buttons
                  thirdPartyLogin(),
                  //TODO: More Login options
                  Center(
                      child: text14Normal(
                          text: "Or use your email account to login")),
                  SizedBox(height: 50.h),
                  //TODO: Email fields
                  appTextField(
                    text: "Email",
                    iconName: "assets/icons/user.png",
                    hintText: "Enter your email",
                  ),
                  SizedBox(height: 20.h),
                  //TODO: Password fields
                  appTextField(
                      text: "Password",
                      iconName: "assets/icons/lock.png",
                      hintText: "Enter your password",
                      obscureText: true),
                  SizedBox(height: 10.h),
                  Container(
                    margin: EdgeInsets.only(
                      left: 25.w,
                    ),
                    child: textUnderline(
                      text: "Forgot Password?",
                    ),
                  ),
                  SizedBox(height: 80.h),
                  //TODO: Login button
                  Center(child: appButton(buttonName: "Login")),
                  SizedBox(height: 10.h),
                  //TODO: Sign up button
                  Center(
                    child: appButton(
                      buttonName: "Register",
                      isLogin: false,
                      context: context,
                    ),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
