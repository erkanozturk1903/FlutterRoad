import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NearMissDetailPage extends StatelessWidget {
  final Map<String, dynamic> formData;

  const NearMissDetailPage({required this.formData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('form_details'.tr),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            ListTile(
              title: Text('business_name'.tr),
              subtitle: Text(formData['business_name'] ?? ''),
            ),
            ListTile(
              title: Text('location'.tr),
              subtitle: Text(formData['location'] ?? ''),
            ),
            ListTile(
              title: Text('date'.tr),
              subtitle: Text(formData['date'] != null
                  ? (formData['date'] as Timestamp).toDate().toString()
                  : ''),
            ),
            ListTile(
              title: Text('name_and_surname'.tr),
              subtitle: Text(formData['adi'] ?? ''),
            ),
            ListTile(
              title: Text('mission'.tr),
              subtitle: Text(formData['mission'] ?? ''),
            ),
            ListTile(
              title: Text('unit_of_work'.tr),
              subtitle: Text(formData['unit'] ?? ''),
            ),
            ListTile(
              title: Text('phone'.tr),
              subtitle: Text(formData['phone'] ?? ''),
            ),
            ListTile(
              title: Text('email'.tr),
              subtitle: Text(formData['email'] ?? ''),
            ),
            ListTile(
              title: Text('description_of_the_incident'.tr),
              subtitle: Text(formData['description'] ?? ''),
            ),
            ListTile(
              title: Text('what_is_the_solution'.tr),
              subtitle: Text(formData['solution'] ?? ''),
            ),
            ListTile(
              title: Text('near_miss_incident'.tr),
              subtitle: Text(formData['near_miss_incident'] != null
                  ? (formData['near_miss_incident'] as bool).toString()
                  : ''),
            ),
            ListTile(
              title: Text('dangerous_situation'.tr),
              subtitle: Text(formData['dangerous_situation'] != null
                  ? (formData['dangerous_situation'] as bool).toString()
                  : ''),
            ),
            ListTile(
              title: Text('opinion_of_the_unit_responsible'.tr),
              subtitle: Text(formData['opinion_unit_responsible'] ?? ''),
            ),
            SizedBox(height: 20),
            Center(
              child: Text(
                'images'.tr,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 10),
            // Burada resimlerin gösterilmesi için bir widget eklenebilir, bu örnekte resimler için bir widget eklenmedi.
          ],
        ),
      ),
    );
  }
}
