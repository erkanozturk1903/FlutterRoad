import 'package:flutter/material.dart';

class CheckboxListPage extends StatefulWidget {
  const CheckboxListPage({super.key});

  @override
  State<CheckboxListPage> createState() => _CheckboxListPageState();
}

class _CheckboxListPageState extends State<CheckboxListPage> {
  List<String> selectedOptions = [];

  final List<String> options = [
    'Saha Denetimi',
    'İş Kazası',
    'Çalışan Önerisi',
    'İç Tetkik',
    'Anket',
    'Dış Denetim',
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: options.length,
      itemBuilder: (context, index) {
        final option = options[index];
        return CheckboxListTile(
          title: Text(option),
          value: selectedOptions.contains(option),
          onChanged: (bool? value) {
            setState(() {
              if (value != null && value) {
                selectedOptions.add(option);
              } else {
                selectedOptions.remove(option);
              }
            });
          },
        );
      },
    );
  }
}
