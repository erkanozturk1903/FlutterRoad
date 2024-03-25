import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WorkPermitDetailPage extends StatelessWidget {
  final QueryDocumentSnapshot<Map<String, dynamic>> document;

  const WorkPermitDetailPage({Key? key, required this.document})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var dateOfGrantor = document.data().containsKey('date_of_grantor')
        ? (document.data()['date_of_grantor'] as Timestamp).toDate()
        : DateTime.now();
    var workingType = document.data().containsKey('working_type')
        ? (document.data()['working_type'] as List).join(', ')
        : 'Unknown'; // Varsayılan değer ya da uygun bir hata işlemi
    var descriptionOfWorkToBeDone =
        document.data().containsKey('description_of_work_to_be_done')
            ? document['description_of_work_to_be_done'] ?? ''
            : '';
    var location = document.data().containsKey('location')
        ? document['location'] ?? ''
        : '';
    var workToDo = document.data().containsKey('work_to_do')
        ? document['work_to_do'] ?? ''
        : '';
    var danger =
        document.data().containsKey('danger') ? document['danger'] ?? '' : '';
    var precautionsToTake = document.data().containsKey('precautions_to_take')
        ? document['precautions_to_take'] ?? ''
        : '';
    var ppeToBeUsed = document.data().containsKey('ppe_to_be_used')
        ? document['ppe_to_be_used'] ?? []
        : [];
    var nameSurnameOfGrantor = document.data().containsKey('name_surname')
        ? document['name_surname'] ?? ''
        : '';

    return Scaffold(
      appBar: AppBar(
        title: Text('work_permit_detail'.tr),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              title: Text('date_of_grantor'.tr),
              subtitle: Text('$dateOfGrantor'),
            ),
            ListTile(
              title: Text('working_type'.tr),
              subtitle: Text('$workingType'),
            ),
            ListTile(
              title: Text('description_of_work_to_be_done'.tr),
              subtitle: Text('$descriptionOfWorkToBeDone'),
            ),
            ListTile(
              title: Text('location'.tr),
              subtitle: Text('$location'),
            ),
            ListTile(
              title: Text('work_to_do'.tr),
              subtitle: Text('$workToDo'),
            ),
            ListTile(
              title: Text('danger'.tr),
              subtitle: Text('$danger'),
            ),
            ListTile(
              title: Text('precautions_to_take'.tr),
              subtitle: Text('$precautionsToTake'),
            ),
            ListTile(
              title: Text('ppe_to_be_used'.tr),
              subtitle: Text('${ppeToBeUsed.join(', ')}'),
            ),
            ListTile(
              title: Text('name_surname_of_grantor'.tr),
              subtitle: Text('$nameSurnameOfGrantor'),
            ),
          ],
        ),
      ),
    );
  }
}
