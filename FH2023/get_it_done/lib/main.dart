import 'package:flutter/material.dart';
import 'package:get_it_done/models/color_theme_data.dart';
import 'package:get_it_done/models/items_data.dart';
import 'package:get_it_done/screens/home_page.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ColorThemeData().createPrefObject();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<ColorThemeData>(
          create: (context) => ColorThemeData(),
        ),
        ChangeNotifierProvider<ItemData>(
          create: (context) => ItemData(),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Provider.of<ColorThemeData>(context).loadThemeData();
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: Provider.of<ColorThemeData>(context).selectedThemeData,
      home: const HomePage(),
    );
  }
}
