import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:midsademy/common/widgets/app_bar.dart';
import 'package:midsademy/common/widgets/button_widgets.dart';
import 'package:midsademy/common/widgets/text_widgets.dart';
import 'package:midsademy/pages/sign_in/widgets/app_textfields.dart';
import 'package:midsademy/pages/sign_in/widgets/sign_in_widgets.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

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
                  SizedBox(height: 20.h),
                  //TODO: More Login options
                  Center(
                    child: text14Normal(
                        text: "Enter your details to below & free sign up"),
                  ),
                  SizedBox(height: 20.h),
                  appTextField(
                    text: "Username",
                    iconName: "assets/icons/user.png",
                    hintText: "Enter your username",
                  ),
                  SizedBox(height: 20.h),
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
                  appTextField(
                      text: "Confirm Password",
                      iconName: "assets/icons/lock.png",
                      hintText: "Enter your confirm password",
                      obscureText: true),
                  SizedBox(height: 10.h),
                  Container(
                    margin: EdgeInsets.only(
                      left: 25.w,
                    ),
                    child: text14Normal(
                      text: "By creating an account you agree to our Terms of Service and Privacy Policy",
                    ),
                  ),

                  SizedBox(height: 80.h),
                  //TODO: Register button
                  Center(
                    child: appButton(
                      buttonName: "Register",
                      context: context,
                      isLogin: true
                    ),
                  ),

                ],
              ),
            )),
      ),
    );
  }
}
