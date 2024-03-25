import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:midsatech_mobile/pages/main/work/work_permit_form/pages/work_permit_details.dart';
import 'package:midsatech_mobile/pages/main/work/work_permit_form/pages/work_permit_form.dart';

class WorkPermitPage extends StatelessWidget {
  const WorkPermitPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF021734),
        title: Text(
          'work_permits'.tr,
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
        stream:
            FirebaseFirestore.instance.collection('work_permits').snapshots(),
        builder: (BuildContext context,
            AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          if (snapshot.hasData && snapshot.data!.docs.isNotEmpty) {
            return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                var document = snapshot.data!.docs[index];
                var date = document['date']?.toDate();
                var workingType = (document.data() as Map<String, dynamic>)
                        .containsKey('working_type')
                    ? (document.data() as Map<String, dynamic>)['working_type']
                    : [];
                return ListTile(
                  title: Text(
                    '${'date'.tr}:${DateFormat('yyyy-MM-dd').format(date!)}',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    '${'working_type'.tr}:${workingType.isNotEmpty ? workingType.join(', ') : 'unknown'.tr}',
                    style: TextStyle(color: Colors.grey.shade700),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            WorkPermitDetailPage(document: document),
                      ),
                    );
                  },
                );
              },
            );
          }
          return Center(child: Text('no_work_permits_found'.tr));
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => WorkPermitFormPage()),
          );
        },
        child: const Icon(Icons.add),
        backgroundColor: Colors.deepOrange,
      ),
    );
  }
}
