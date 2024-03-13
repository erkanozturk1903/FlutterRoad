import 'package:flutter/material.dart';
import 'package:midsatech_mobile/common/widget/app_bar.dart';
import 'package:midsatech_mobile/common/widget/button_widget.dart';
import 'package:midsatech_mobile/common/widget/text_widgets.dart';
import 'package:midsatech_mobile/pages/auth/widgets/app_textfields.dart';


class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return

  Scaffold(
            appBar: buildAppbar(),
            backgroundColor: const Color(0xFF021734),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                 const SizedBox(height: 20),
                  //TODO: More Login options
                  Center(
                    child: text14Normal(
                        text: "Enter your details to below & free sign up"),
                  ),
                  const SizedBox(height: 15),
                  appTextField(
                    text: "Username",
                    iconName: "assets/icons/user.png",
                    hintText: "Enter your username",
                  ),
                 const SizedBox(height: 20),
                  //TODO: Email fields
                  appTextField(
                    text: "Email",
                    iconName: "assets/icons/user.png",
                    hintText: "Enter your email",
                  ),
                  const SizedBox(height: 20),
                  //TODO: Password fields
                  appTextField(
                      text: "Password",
                      iconName: "assets/icons/lock.png",
                      hintText: "Enter your password",
                      obscureText: true),
                  const SizedBox(height: 10),
                  appTextField(
                      text: "Confirm Password",
                      iconName: "assets/icons/lock.png",
                      hintText: "Enter your confirm password",
                      obscureText: true),

                  const SizedBox(height: 60),
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

      ),
    );
  }
}
