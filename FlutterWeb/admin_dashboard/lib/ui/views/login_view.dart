// ignore_for_file: curly_braces_in_flow_control_structures

import 'package:admin_dashboard/providers/auth_provider.dart';
import 'package:admin_dashboard/providers/login_form_provider.dart';
import 'package:admin_dashboard/router/router.dart';
import 'package:admin_dashboard/ui/buttons/custom_outlined_button.dart';
import 'package:admin_dashboard/ui/inputs/custom_inputs.dart';
import 'package:admin_dashboard/ui/buttons/link_text.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    return ChangeNotifierProvider(
        create: (_) => LoginFormProvider(),
        child: Builder(
          builder: (context) {
            final loginFormProvider =
                Provider.of<LoginFormProvider>(context, listen: false);

            return Container(
              margin: const EdgeInsets.only(top: 100),
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(
                    maxWidth: 370,
                  ),
                  child: Form(
                    autovalidateMode: AutovalidateMode.always,
                    key: loginFormProvider.formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          validator: (value) {
                            if (!EmailValidator.validate(value ?? ''))
                              return 'Email geçersiz';
                            return null;
                          },
                          onChanged: (value) => loginFormProvider.email = value,
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                          decoration: CustomInputs.loginInputDecoration(
                            hint: 'Email Adresinizi Giriniz',
                            label: 'Email',
                            icon: Icons.email_outlined,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          onChanged: (value) =>
                              loginFormProvider.password = value,
                          validator: (value) {
                            if (value == null || value.isEmpty)
                              return 'Şifrenizi Girin';
                            if (value.length < 6) return 'Şifreniz çok kısa';
                            return null;
                          },
                          obscureText: true,
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                          decoration: CustomInputs.loginInputDecoration(
                            hint: 'Şifrenizi Giriniz',
                            label: 'Şifre',
                            icon: Icons.lock_outline_rounded,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        CustomOutlinedButton(
                          onPressed: () {
                            final isValid = loginFormProvider.validateForm();
                            if (isValid)
                              authProvider.login(loginFormProvider.email,
                                  loginFormProvider.password);
                          },
                          text: 'Giriş Yap',
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        LinkText(
                          text: 'Yeni Hesap',
                          onPressed: () {
                            Navigator.pushNamed(
                              context,
                              Flurorouter.registerRoute,
                            );
                          },
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ));
  }
}
