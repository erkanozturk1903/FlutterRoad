import 'package:flutter/material.dart';
import 'package:midsatech_mobile/common/utils/app_colors.dart';
import 'package:midsatech_mobile/common/widget/button_widget.dart';
import 'package:midsatech_mobile/common/widget/text_widgets.dart';
import 'package:midsatech_mobile/pages/auth/register.dart';
import 'package:midsatech_mobile/pages/auth/widgets/app_textfields.dart';
import 'package:midsatech_mobile/pages/auth/widgets/sign_in_widgets.dart';
import 'package:midsatech_mobile/pages/main/home.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFF021734),
        body: SafeArea(
            child: SingleChildScrollView(
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: SizedBox(
                  height: 120,
                  width: 120,
                  child: Image.asset(
                    'assets/app_logo.jpeg',
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              thirdPartyLogin(),
              const SizedBox(
                height: 10,
              ),
              Center(
                child: text14Normal(text: 'Or use your email account to login'),
              ),
              const SizedBox(height: 30),
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
              Container(
                child: textUnderline(
                  text: "Forgot Password?",
                ),
              ),
              const SizedBox(height: 60),
              //TODO: Login button

              Center(
                child: appButton(
                    buttonName: "Login",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HomePage(),
                        ),
                      );
                    }),
              ),

              const SizedBox(height: 10),
              //TODO: Sign up button
              Center(
                child: appButton(
                    buttonName: "Register",
                    isLogin: false,
                    context: context,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SignUpPage(),
                        ),
                      );
                    }),
              ),
            ],
          ),
        )));
  }
}
