import 'package:flutter/material.dart';
import 'package:flutter_restapi_todo_app/provider/auth/auth_provider.dart';
import 'package:flutter_restapi_todo_app/screens/auth/register.dart';
import 'package:flutter_restapi_todo_app/utils/routers.dart';
import 'package:flutter_restapi_todo_app/utils/snack_message.dart';
import 'package:flutter_restapi_todo_app/widgets/button.dart';
import 'package:flutter_restapi_todo_app/widgets/text_field.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Page'),
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Container(
              padding: EdgeInsets.all(15),
              child: Column(
                children: [
                  customTextField(
                    controller: _emailController,
                    title: 'Email',
                    hint: "Enter your valid email address",
                  ),
                  customTextField(
                    controller: _passwordController,
                    title: 'Password',
                    hint: "Enter your password",
                  ),

                  //BUTTON
                  Consumer<AuthProvider>(builder: (context, auth, child) {
                    WidgetsBinding.instance!.addPostFrameCallback((_) {
                      if (auth.resMessage != '') {
                        showMessage(
                          message: auth.resMessage,
                          context: context,
                        );

                        auth.clear();
                      }
                    });
                    return customButton(
                      text: 'Login',
                      onPressed: () {
                        if (_emailController.text.isEmpty ||
                            _passwordController.text.isEmpty) {
                          showMessage(
                              message: "Please fill all fields",
                              context: context);
                          return;
                        } else {
                          auth.loginUser(
                            email: _emailController.text.trim(),
                            password: _passwordController.text.trim(),
                          );
                        }
                      },
                      context: context,
                      status: auth.isLoading,
                    );
                  }),

                  const SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      PageNavigator(context: context).nextPageOnly(
                        page: const RegisterPage(),
                      );
                    },
                    child: const Text(
                      'Register',
                      style: TextStyle(
                        color: Colors.deepPurple,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
