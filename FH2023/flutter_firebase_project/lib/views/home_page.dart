import 'package:flutter/material.dart';
import 'package:flutter_firebase_project/services/auth.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        actions: [
          IconButton(
            onPressed: () async {
              Provider.of<Auth>(context, listen: false).signOut();
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: const Center(
        child: Text("Welcome Home Page"),
      ),
    );
  }
}
