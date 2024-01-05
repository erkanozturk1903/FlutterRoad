import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_project/firebase_options.dart';
import 'package:flutter_firebase_project/services/auth.dart';
import 'package:flutter_firebase_project/widgets/on_board.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Provider<Auth>(
      create: (context) => Auth(),
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: FutureBuilder(
          future: _initialization,
          builder: ((context, snapshot) {
            if (snapshot.hasError) {
              return const Scaffold(
                body: Center(
                  child: Text('Error'),
                ),
              );
            } else if (snapshot.connectionState == ConnectionState.done) {
              return const OnBoardingWidget();
            } else {
              return const Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }
          }),
        ),
      ),
    );
  }
}
