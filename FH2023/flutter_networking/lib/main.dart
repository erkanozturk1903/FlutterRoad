import 'package:flutter/material.dart';

import 'ui/bookshelf_screen.dart';

void main() => runApp(const BookshelfApp());

class BookshelfApp extends StatelessWidget {
  const BookshelfApp({super.key});

  @override
  Widget build(BuildContext context) => const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: BookshelfScreen(),
      );
}
