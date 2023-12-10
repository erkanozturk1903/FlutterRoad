// ignore_for_file: curly_braces_in_flow_control_structures, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:admin_dashboard/providers/login_form_provider.dart';
import 'package:admin_dashboard/router/router.dart';
import 'package:admin_dashboard/ui/layout/auth/widgets/auth_widgets.dart';
import 'package:admin_dashboard/ui/shared/widgets/snackbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late String email;
  late String password;
  bool processing = false;

  final GlobalKey<ScaffoldMessengerState> _scaffoldKey =
      GlobalKey<ScaffoldMessengerState>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool passwordVisible = false;

  void navigate() {
    Navigator.pushNamed(
      context,
      Flurorouter.dashboardRoute,
    );
  }

  void login() async {
    setState(() {
      processing = true;
    });
    if (_formKey.currentState!.validate()) {
      try {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
        _formKey.currentState!.reset();

        navigate();
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          setState(() {
            processing = false;
          });
          MyMessageHandler.showSnackBar(
            _scaffoldKey,
            'No user found for that email.',
          );
        } else if (e.code == 'wrong-password') {
          setState(() {
            processing = false;
          });
          MyMessageHandler.showSnackBar(
            _scaffoldKey,
            'Wrong password provided for that user.',
          );
        } else {
          setState(() {
            processing = false;
          });
          MyMessageHandler.showSnackBar(
            _scaffoldKey,
            'Please fill in all fields.',
          );
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => LoginFormProvider(),
        child: Builder(
          builder: (context) {
            return ScaffoldMessenger(
              key: _scaffoldKey,
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
                    child: SingleChildScrollView(
                      keyboardDismissBehavior:
                          ScrollViewKeyboardDismissBehavior.onDrag,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Form(
                          autovalidateMode: AutovalidateMode.always,
                          key: _formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AuthHeaderLabel(headerLabel: 'Login'),
                              const SizedBox(
                                height: 5,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10.0),
                                child: TextFormField(
                                  onChanged: (value) {
                                    email = value;
                                  },
                                  controller: emailController,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Please enter your email';
                                    } else if (value.isValidEmail() == false) {
                                      return 'Please enter a valid email';
                                    } else if (value.isValidEmail() == true) {
                                      return null;
                                    }
                                    return null;
                                  },
                                  keyboardType: TextInputType.emailAddress,
                                  decoration: textFormDecoration.copyWith(
                                    labelText: "Email Address",
                                    hintText: "Plesae enter your email address",
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 10.0),
                                child: TextFormField(
                                  onChanged: (value) {
                                    password = value;
                                  },
                                  controller: passwordController,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Please enter your password";
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
                                        color: Colors.white.withOpacity(0.6),
                                      ),
                                    ),
                                    labelText: "Password",
                                    hintText: "Please enter your password",
                                  ),
                                ),
                              ),
                              /*  TextButton(
                                onPressed: () {},
                                child: Text(
                                  'Forgot Password?',
                                  style: TextStyle(
                                    fontStyle: FontStyle.italic,
                                    fontSize: 18,
                                    color: Colors.white.withOpacity(0.6),
                                  ),
                                ),
                              ), */
                              HaveAccount(
                                haveAccount: "Are You A Member?",
                                actionLabel: "Sign Up",
                                onPressed: () {
                                  Navigator.pushNamed(
                                    context,
                                    Flurorouter.registerRoute,
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
                                      mainButtonLabel: "Login",
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
          },
        ));
  }
}
