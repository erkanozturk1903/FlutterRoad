import 'package:flutter/material.dart';
import 'package:flutter_firebase_project/services/auth.dart';
import 'package:flutter_firebase_project/views/email_sign_in.dart';
import 'package:flutter_firebase_project/widgets/my_elevated_button.dart';
import 'package:provider/provider.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  bool _isLoading = false;

  Future<void> _signInAnonymously() async {
    setState(() {
      _isLoading = true;
    });
    final user =
        await Provider.of<Auth>(context, listen: false).signInAnonymously();
    setState(() {
      _isLoading = false;
    });
    print(user.uid);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Sign In Page',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 40),
          MyElevatedButotn(
            onPressed: _isLoading ? null : _signInAnonymously,
            backgroundColor: Colors.yellow.shade900,
            child: const Text(
              'Sign In Anonymously',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(height: 10),
          MyElevatedButotn(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const EmailSignPage();
              }));
            },
            backgroundColor: Colors.blue.shade800,
            child: const Text(
              'Sign In with Email And Password',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(height: 10),
          MyElevatedButotn(
            onPressed: () {},
            backgroundColor: Colors.red,
            child: const Text(
              'Sign In with Google',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(height: 10),
          MyElevatedButotn(
            onPressed: () {},
            backgroundColor: Colors.black,
            child: const Text(
              'Sign In with Apple',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ],
      )),
    );
  }
}
