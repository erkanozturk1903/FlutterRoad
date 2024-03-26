// ignore_for_file: prefer_const_literals_to_create_immutables, use_key_in_widget_constructors, unnecessary_null_comparison

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:midsatech_mobile/pages/main/work/field_surveillance_form/models/field_surveiallance.dart';
import 'package:midsatech_mobile/pages/main/work/field_surveillance_form/pages/field_surveillance_form.dart';
import 'package:midsatech_mobile/pages/main/work/field_surveillance_form/pages/form_details.dart';

class FieldSurveillancePage extends StatefulWidget {
  const FieldSurveillancePage({super.key});

  @override
  State<FieldSurveillancePage> createState() => _FieldSurveillancePageState();
}

class _FieldSurveillancePageState extends State<FieldSurveillancePage> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF021734),
        foregroundColor: Colors.white,
        title: Text(
          'field_surveillance_form'.tr,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FieldSurveillanceFormPage(),
            ),
          );
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
        backgroundColor: Colors.deepOrange,
      ),
      body: StreamBuilder(
        stream: _firestore.collection('field_surveillance_forms').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Center(child: Text('No forms available'));
          }
          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (BuildContext context, int index) {
              var formData = snapshot.data!.docs[index];
              var formModel = FieldSurveillanceFormModel.fromMap(
                  formData.data() as Map<String, dynamic>);
              return Card(
                elevation: 2,
                margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: ListTile(
                  title: Text(
                    'Date: ${DateFormat('yyyy-MM-dd').format(formModel.date)}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    'Definition of Nonconformity: ${formModel.definitionOfNonconformity}',
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            FormDetailsPage(formModel: formModel),
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
