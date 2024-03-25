import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

class Checklist {
  String title;
  List<ChecklistItem> items;

  Checklist({required this.title, required this.items});

  factory Checklist.fromJson(Map<String, dynamic> json) {
    return Checklist(
      title: json['title'],
      items: (json['items'] as List)
          .map((i) => ChecklistItem.fromJson(i))
          .toList(),
    );
  }
}

class ChecklistItem {
  String description;
  bool isChecked;

  ChecklistItem({required this.description, this.isChecked = false});

  factory ChecklistItem.fromJson(Map<String, dynamic> json) {
    return ChecklistItem(
      description: json['description'],
      isChecked: json['isChecked'] ?? false,
    );
  }
}

Future<List<Checklist>> loadChecklists() async {
  final String response = await rootBundle.loadString('assets/form/form.json');
  final data = json.decode(response);
  return (data['checklists'] as List)
      .map((c) => Checklist.fromJson(c))
      .toList();
}
