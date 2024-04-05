// ignore_for_file: avoid_print, unused_field, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:multistore_app/widget/auth_widgets.dart';

class SupplierLogin extends StatefulWidget {
  const SupplierLogin({super.key});

  @override
  State<SupplierLogin> createState() => _SupplierLoginState();
}

class _SupplierLoginState extends State<SupplierLogin> {
  late String email;
  late String password;
  bool processing = false;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldMessengerState> _scaffoldKey =
      GlobalKey<ScaffoldMessengerState>();
  bool passwordVisible = false;

  void login() async {}

  @override
  Widget build(BuildContext context) {
    return ScaffoldMessenger(
      key: _scaffoldKey,
      child: Scaffold(
        body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              reverse: true,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const AuthHeaderLabel(
                        headerLabel: 'Giriş Yap',
                      ),
                      const SizedBox(
                        height: 100,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: TextFormField(
                          onChanged: (value) {
                            email = value;
                          },
                          //controller: _emailController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Lütfen email adresinizi giriniz';
                            } else if (value.isValidEmail() == false) {
                              return 'Geçersiz email';
                            } else if (value.isValidEmail() == true) {
                              return null;
                            }
                            return null;
                          },
                          keyboardType: TextInputType.emailAddress,
                          decoration: textFormDecoration.copyWith(
                            labelText: 'Email Adres',
                            hintText: 'Lütfen email adresinizi giriniz',
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: TextFormField(
                            onChanged: (value) {
                              password = value;
                            },
                            // controller: _passwordController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Lütfen şifrenizi giriniz';
                              }
                              return null;
                            },
                            obscureText: passwordVisible,
                            decoration: textFormDecoration.copyWith(
                              suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    passwordVisible = !passwordVisible;
                                  });
                                },
                                icon: Icon(
                                  passwordVisible
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: Colors.purple,
                                ),
                              ),
                              labelText: 'Şifre',
                              hintText: 'Lütfen şifrenizi giriniz',
                            )),
                      ),
                      TextButton(
                          onPressed: () {},
                          child: const Text(
                            'Şifremi Unuttum',
                            style: TextStyle(
                              fontStyle: FontStyle.italic,
                              fontSize: 18,
                            ),
                          )),
                      HaveAccount(
                        haveAccount: 'Üye Değil misin?',
                        actionLabel: 'Üye Ol',
                        onPressed: () {
                          Navigator.pushReplacementNamed(
                            context,
                            '/supplier_signup_screen',
                          );
                        },
                      ),
                      processing == true
                          ? const Center(
                              child: CircularProgressIndicator(
                                color: Colors.purple,
                              ),
                            )
                          : AuthMainButton(
                              mainButtonLabel: 'Giriş Yap',
                              onPressed: () async {
                                login();
                              },
                            )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
