// ignore_for_file: prefer_const_literals_to_create_immutables, use_key_in_widget_constructors, unused_element, use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:midsatech_mobile/pages/main/work/equitment_control_form/equintment_details.dart';
import 'package:midsatech_mobile/pages/main/work/equitment_control_form/equitment_control_form/equitment_form.dart';
import 'package:midsatech_mobile/pages/main/work/equitment_control_form/models/checklist_item.dart';

class EquitmentControlFormPage extends StatefulWidget {
  const EquitmentControlFormPage({super.key});

  @override
  State<EquitmentControlFormPage> createState() =>
      _EquitmentControlFormPageState();
}

class _EquitmentControlFormPageState extends State<EquitmentControlFormPage> {
  Future<void> showSelectDialog(BuildContext context) async {
    DateTime? selectedDate;
    String? selectedTitle;

    selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    );

    if (selectedDate == null) return; // Tarih seçilmediyse işlemi durdur.

    final List<Checklist> checklists =
        await loadChecklists(); // JSON dosyasından checklistleri yükleme fonksiyonu

    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("select_a_checklist".tr),
          content: SingleChildScrollView(
            child: ListBody(
              children: checklists.map((checklist) {
                return ListTile(
                  title: Text(checklist.title),
                  onTap: () {
                    selectedTitle = checklist.title;
                    Navigator.of(context).pop();
                  },
                );
              }).toList(),
            ),
          ),
        );
      },
    );

    if (selectedTitle != null) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => EquitmentControlForm(
            title: selectedTitle!,
            checklists:
                checklists.where((c) => c.title == selectedTitle).toList(),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF021734),
        foregroundColor: Colors.white,
        title:  Text(
          'equipment_control_form'.tr,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          showSelectDialog(context);
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
        backgroundColor: Colors.deepOrange,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('checklists').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          List<DocumentSnapshot> document = snapshot.data!.docs;
          return ListView.builder(
            itemCount: document.length,
            itemBuilder: (context, index) {
              Map data = document[index].data() as Map;
              String docID = document[index].id;
              DateTime date = (data['createdAt'] as Timestamp).toDate();
              String formattedDate =
                  DateFormat('yyyy-MM-dd – kk:mm').format(date);

              return Card(
                child: ListTile(
                  title: Text(
                    data['title'],
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    formattedDate,
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            ChecklistDetailsPage(docID: docID),
                      ),
                    );
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
