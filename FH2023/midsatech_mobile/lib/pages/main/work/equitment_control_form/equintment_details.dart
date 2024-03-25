import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChecklistDetailsPage extends StatefulWidget {
  final String docID;

  const ChecklistDetailsPage({Key? key, required this.docID}) : super(key: key);

  @override
  _ChecklistDetailsPageState createState() => _ChecklistDetailsPageState();
}

class _ChecklistDetailsPageState extends State<ChecklistDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('checklist_details'.tr),
      ),
      body: StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance
            .collection('checklists')
            .doc(widget.docID)
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return CircularProgressIndicator();
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;
          List items = data['items'];

          return ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              var item = items[index];
              return CheckboxListTile(
                title: Text(item['description']),
                value: item['isChecked'],
                onChanged: (bool? value) {
                  setState(() {
                    items[index]['isChecked'] = value;
                    // Bu değişikliği Firestore'a kaydetmek için ayrı bir fonksiyon yazılmalıdır.
                    saveChecklistItemState(widget.docID, items);
                  });
                },
              );
            },
          );
        },
      ),
    );
  }

  void saveChecklistItemState(String docID, List items) {
    // Firestore'daki belirli bir checklist belgesindeki öğelerin durumunu güncelleyin.
    FirebaseFirestore.instance.collection('checklists').doc(docID).update({
      'items': items,
    });
  }
}
