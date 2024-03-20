import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:midsatech_mobile/pages/main/work/work_accident/models/is_kazasi_model.dart';

class IsKazasiListesi extends StatefulWidget {
  @override
  _IsKazasiListesiState createState() => _IsKazasiListesiState();
}

class _IsKazasiListesiState extends State<IsKazasiListesi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Work Accident List'),
        backgroundColor: Colors.deepOrange,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('midsatech/customers/users/is_kazasi_report').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return Center(child: CircularProgressIndicator());

          List<DocumentSnapshot> docs = snapshot.data!.docs;
          return ListView.builder(
            itemCount: docs.length,
            itemBuilder: (context, index) {
              Map<String, dynamic> data = docs[index].data() as Map<String, dynamic>;
              IsKazasiReport report = IsKazasiReport.fromForm(data, imageFileList);
              
              return ListTile(
                title: Text(report.accidentDate.toString()),
                subtitle: Text(report.accidentIncidentType.join(', ')),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => IsKazasiDetay(report: report)),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}

class IsKazasiDetay extends StatelessWidget {
   final IsKazasiReport report;

  IsKazasiDetay(this.report);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Accident Details'),
        backgroundColor: Colors.deepOrange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Date: ${report.accidentDate}'),
            Text('Incident Type: ${report.accidentIncidentType.join(', ')}'),
            // Diğer alanlar...
          ],
        ),
      ),
    );
  }
}
