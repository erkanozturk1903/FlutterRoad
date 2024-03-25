import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:midsatech_mobile/pages/main/work/equitment_control_form/models/checklist_item.dart';

class EquitmentControlForm extends StatefulWidget {
  final String title;
  final List<Checklist> checklists;
  const EquitmentControlForm(
      {super.key, required this.title, required this.checklists});

  @override
  State<EquitmentControlForm> createState() => _EquitmentControlFormState();
}

class _EquitmentControlFormState extends State<EquitmentControlForm> {
  @override
  void initState() {
    super.initState();
    // Dışarıdan gelen checklists kullanılacak, dolayısıyla burada loadChecklists çağrısına gerek yok.
  }

  void saveChecklistToFirebase(String title, List<ChecklistItem> items) {
    final firestoreInstance = FirebaseFirestore.instance;
    firestoreInstance.collection("checklists").add({
      "title": title,
      "items": items
          .map((item) =>
              {"description": item.description, "isChecked": item.isChecked})
          .toList(),
      "createdAt": FieldValue.serverTimestamp(),
    });
  }

  @override
  Widget build(BuildContext context) {
    // Eğer checklists listesi boş ise, bir yükleme çarkı veya boş liste mesajı göster
    if (widget.checklists.isEmpty) {
      return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(child: Text("No checklist items found.")),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.builder(
        itemCount: widget.checklists.first.items.length,
        itemBuilder: (context, index) {
          final item = widget.checklists.first.items[index];
          return CheckboxListTile(
            title: Text(item.description),
            value: item.isChecked,
            onChanged: (bool? value) {
              setState(() {
                item.isChecked = value!;
              });
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          saveChecklistToFirebase(widget.title, widget.checklists.first.items);
          Navigator.pop(context);
        },
        child: Icon(Icons.save),
      ),
    );
  }
}
