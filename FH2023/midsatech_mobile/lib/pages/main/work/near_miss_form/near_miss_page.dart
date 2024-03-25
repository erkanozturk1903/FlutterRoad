// ignore_for_file: prefer_const_literals_to_create_immutables, use_key_in_widget_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:midsatech_mobile/pages/main/work/near_miss_form/page/near_miss_form.dart';
import 'package:midsatech_mobile/pages/main/work/near_miss_form/page/near_missing.dart';

class NearMissPage extends StatefulWidget {
  const NearMissPage({super.key});

  @override
  State<NearMissPage> createState() => _NearMissPageState();
}

class _NearMissPageState extends State<NearMissPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF021734),
        foregroundColor: Colors.white,
        title: Text(
          'near_miss_actions'.tr,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => NearMissFormPage()),
          );
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
        backgroundColor: Colors.deepOrange,
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('near_miss_forms')
            .snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else {
            final forms = snapshot.data!.docs;
            return ListView.builder(
              itemCount: forms.length,
              itemBuilder: (context, index) {
                final form = forms[index];
                final formData = form.data() as Map<String, dynamic>;
                final date = (formData['date'] as Timestamp).toDate();
                return Card(
                  child: ListTile(
                    title: Text(
                      '${formData['business_name']} - ${DateFormat('yyyy-MM-dd').format(date)}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      '${formData['adi']} - ${formData['location']}',
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              NearMissDetailPage(formData: formData),
                        ),
                      );
                    },
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
