// ignore_for_file: unnecessary_cast

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:midsatech_mobile/pages/main/work/work_accident/work_accident.dart';

class IsKazasiListesi extends StatefulWidget {
  @override
  _IsKazasiListesiState createState() => _IsKazasiListesiState();
}

class _IsKazasiListesiState extends State<IsKazasiListesi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF021734),
        foregroundColor: Colors.white,
        title: Text(
          'work_accident_list'.tr,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('midsatech')
            .doc('customers')
            .collection('administrator')
            .doc('is_kazasi_report')
            .collection('reports')
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData)
            return Center(child: CircularProgressIndicator());

          List<DocumentSnapshot> docs = snapshot.data!.docs;
          return ListView.builder(
            itemCount: docs.length,
            itemBuilder: (context, index) {
              Map<String, dynamic> data =
                  docs[index].data() as Map<String, dynamic>;
              IsKazasiReport reports = IsKazasiReport.fromMap({
                'accident_date': data['accident_date'],
                'accident_incident_type': data['accident_incident_type'],
              });
              DateTime date = DateTime.parse(reports.accidentDate);
              String formattedDate = '${date.day}-${date.month}-${date.year}';
              return ListTile(
                title: Text(formattedDate),
                subtitle: Text(reports.accidentIncidentType.join(', ')),
                trailing: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => IsKazasiDetay(reports)),
                    );
                  },
                  child: Text('details'.tr),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => IsKazasiFormPage()),
          );
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
        backgroundColor: Colors.deepOrange,
      ),
    );
  }
}

class IsKazasiDetay extends StatelessWidget {
  final IsKazasiReport report;

  IsKazasiDetay(this.report);

  @override
  Widget build(BuildContext context) {
    DateTime date = DateTime.parse(report.accidentDate);
    String formattedDate = '${date.day}-${date.month}-${date.year}';
    return Scaffold(
      appBar: AppBar(
        title: Text('accident_details'.tr),
        backgroundColor: const Color(0xFF021734),
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Date: ${formattedDate}'),
            Text('Incident Type: ${report.accidentIncidentType.join(', ')}'),
            // Diğer alanlar...
          ],
        ),
      ),
    );
  }
}

class IsKazasiReport {
  final String accidentDate;
  final List<String> accidentIncidentType;

  IsKazasiReport(
      {required this.accidentDate, required this.accidentIncidentType});

  factory IsKazasiReport.fromMap(Map<String, dynamic> map) {
    return IsKazasiReport(
      accidentDate: map['accident_date'],
      accidentIncidentType: List<String>.from(map['accident_incident_type']),
    );
  }
}
