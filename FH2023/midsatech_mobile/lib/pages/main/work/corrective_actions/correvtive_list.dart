import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:midsatech_mobile/pages/main/work/corrective_actions/correctivite_form/correctivite_form.dart';

class CorrectiveActionsListPage extends StatefulWidget {
  @override
  _CorrectiveActionsListPageState createState() =>
      _CorrectiveActionsListPageState();
}

class _CorrectiveActionsListPageState extends State<CorrectiveActionsListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('corrective_actions_list'.tr),
        backgroundColor: const Color(0xFF021734),
        foregroundColor: Colors.white,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('midsatech')
            .doc('customers')
            .collection('administrator')
            .doc('dof')
            .collection('dof_list')
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text('Something went wrong');
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          }
          final data = snapshot.requireData;

          return ListView.builder(
            itemCount: data.size,
            itemBuilder: (context, index) {
              var correctiveAction = data.docs[index];

              DateTime date;
              try {
                date = DateFormat('yyyy-MM-dd')
                    .parse(correctiveAction['date'], true)
                    .toLocal();
              } catch (e) {
                date = DateTime.now();
                print(e.toString());
              }
              String formattedDate = DateFormat('yyyy-MM-dd').format(date);
              var cpaResult = correctiveAction['cpaResult'].join(', ');

              return ListTile(
                title: Text(formattedDate),
                subtitle: Text(cpaResult),
                trailing: IconButton(
                  icon: Icon(Icons.arrow_forward),
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CorrectiveActionDetailPage(
                          correctiveActionData:
                              correctiveAction.data() as Map<String, dynamic>),
                    ),
                  ),
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
            MaterialPageRoute(builder: (context) => CorrectiviteFormPage()),
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

class CorrectiveActionDetailPage extends StatelessWidget {
  final Map<String, dynamic> correctiveActionData;

  const CorrectiveActionDetailPage(
      {Key? key, required this.correctiveActionData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // String tarih bilgisini DateTime'a dönüştür
    DateTime date;
    try {
      date = DateFormat('yyyy-MM-dd')
          .parse(correctiveActionData['date'], true)
          .toLocal();
    } catch (e) {
      // Hatalı veya beklenmeyen bir formatla karşılaşıldığında varsayılan bir tarih ver
      date = DateTime.now();
      print('Date parsing error: $e');
    }
    var formattedDate = DateFormat('yyyy-MM-dd').format(date);

    return Scaffold(
      appBar: AppBar(
        title: Text('corrective_actions_details'.tr),
        backgroundColor: const Color(0xFF021734),
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('${'business_name'.tr}:${correctiveActionData['businessName']}'),
            SizedBox(height: 10),
            Text('CPA Number: ${correctiveActionData['cpaNumber']}'),
            SizedBox(height: 10),
            Text('Date: $formattedDate'),
            SizedBox(height: 10),
            Text('CPA Result: ${correctiveActionData['cpaResult'].join(', ')}'),
            // Diğer alanlar burada listelenebilir.
          ],
        ),
      ),
    );
  }
}
