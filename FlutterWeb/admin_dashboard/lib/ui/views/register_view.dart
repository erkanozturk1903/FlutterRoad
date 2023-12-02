import 'package:admin_dashboard/providers/register_form_provider.dart';
import 'package:admin_dashboard/router/router.dart';
import 'package:admin_dashboard/ui/buttons/custom_outlined_button.dart';
import 'package:admin_dashboard/ui/inputs/custom_inputs.dart';
import 'package:admin_dashboard/ui/buttons/link_text.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    final registerFormProvider =
        Provider.of<RegisterFormProvider>(context, listen: false);

    return ChangeNotifierProvider(
      create: (_) => RegisterFormProvider(),
      child: Container(
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
              key: registerFormProvider.formKey,
              child: Column(
                children: [
                  TextFormField(
                    onChanged: (value) => registerFormProvider.name = value,
                    validator: (value) {
                      if (value == null || value.isEmpty)
                        return 'Lütfen adınızı giriniz';
                      return null;
                    },
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                    decoration: CustomInputs.loginInputDecoration(
                      hint: 'Adınız ve Soyadınız',
                      label: 'Adınız',
                      icon: Icons.supervised_user_circle_sharp,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    onChanged: (value) => registerFormProvider.email = value,
                    validator: (value) {
                      if (!EmailValidator.validate(value ?? ''))
                        return 'Email geçersiz';
                      return null;
                    },
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
                    onChanged: (value) => registerFormProvider.password = value,
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
                      registerFormProvider.validateForm();
                    },
                    text: 'Kayıt Ol',
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  LinkText(
                    text: 'Giriş Yap',
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        Flurorouter.loginRoute,
                      );
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
