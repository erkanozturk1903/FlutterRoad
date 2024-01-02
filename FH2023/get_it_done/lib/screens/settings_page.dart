// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:get_it_done/models/color_theme_data.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: const Text(
          'Theme Settings',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        elevation: 2,
      ),
      body: SwitchCard(),
    );
  }
}

class SwitchCard extends StatefulWidget {
  const SwitchCard({super.key});

  @override
  State<SwitchCard> createState() => _SwitchCardState();
}

class _SwitchCardState extends State<SwitchCard> {
  @override
  Widget build(BuildContext context) {
    bool _value = Provider.of<ColorThemeData>(context).isGreenTheme;
    return Card(
      child: SwitchListTile(
        subtitle: Text(
          'Change the theme color to ${_value ? 'Red' : 'Green'}',
          style: const TextStyle(color: Colors.black),
        ),
        title: const Text(
          'Change Theme Color',
          style: TextStyle(color: Colors.black),
        ),
        value: _value,
        onChanged: (value) {
          setState(() {
            _value = value;
          });
          Provider.of<ColorThemeData>(context, listen: false)
              .changeTheme(_value);
        },
      ),
    );
  }
}
