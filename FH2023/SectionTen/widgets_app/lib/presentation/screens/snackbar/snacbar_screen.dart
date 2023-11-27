import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SnackBarScreen extends StatelessWidget {
  static const name = 'snackbar_screen';

  const SnackBarScreen({super.key});

  void showCustomSnackBar(BuildContext context) {
    final snackBar = SnackBar(
      content: const Text('Hello World'),
      action: SnackBarAction(label: 'Ok!', onPressed: () {}),
      duration: const Duration(seconds: 2),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void openDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Emin misin'),
        content: const Text(
            'Consectetur minim ad commodo laborum mollit elit proident consectetur dolor ullamco voluptate sint irure.'),
        actions: [
          TextButton(
            onPressed: () => context.pop(),
            child: const Text('Kapat'),
          ),
          FilledButton(
              onPressed: () => context.pop(), child: const Text('Onayla'))
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Snackbar Dialog"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton.tonal(
              onPressed: () {
                showAboutDialog(
                    context: context, children: [const Text('Deneme 123')]);
              },
              child: const Text('Kullanılan Lisanslar'),
            ),
            FilledButton.tonal(
              onPressed: () => openDialog(context),
              child: const Text('İletişim Kutusunu Göster'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => showCustomSnackBar(context),
        label: const Text("Mostrar Snackbar"),
        icon: const Icon(Icons.remove_red_eye_outlined),
      ),
    );
  }
}
