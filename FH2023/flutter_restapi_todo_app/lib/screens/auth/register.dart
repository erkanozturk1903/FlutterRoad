import 'package:flutter/material.dart';
import 'package:flutter_restapi_todo_app/screens/auth/login.dart';
import 'package:flutter_restapi_todo_app/utils/routers.dart';
import 'package:flutter_restapi_todo_app/widgets/button.dart';
import 'package:flutter_restapi_todo_app/widgets/text_field.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();

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
                    controller: _firstNameController,
                    title: 'First Name',
                    hint: "Enter your first name",
                  ),
                  customTextField(
                    controller: _lastNameController,
                    title: 'Last Name',
                    hint: "Enter your last name",
                  ),
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
                  customButton(
                    text: 'Register',
                    onPressed: () {},
                    context: context,
                    status: false,
                  ),

                  const SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      PageNavigator(context: context).nextPageOnly(
                        page: const LoginPage(),
                      );
                    },
                    child: const Text(
                      'Login here',
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
