// ignore_for_file: prefer_const_literals_to_create_immutables, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:midsatech_mobile/pages/main/work/field_surveillance_form/pages/field_surveillance_form.dart';

class FieldSurveillancePage extends StatefulWidget {
  const FieldSurveillancePage({super.key});

  @override
  State<FieldSurveillancePage> createState() => _FieldSurveillancePageState();
}

class _FieldSurveillancePageState extends State<FieldSurveillancePage> {
  List<FieldSurveillance> workDefinitonListesi = [
    FieldSurveillance('01.01.2024', 'Working at Height'),
    FieldSurveillance('02.01.2021', 'Working in Confined Spaces'),
    FieldSurveillance('03.01.2021', 'Working with Lifting Equipment'),
  ];

  void yeniCalismaFormuEkle(FieldSurveillance yeniDefinitonNonconformity) {
    setState(() {
      workDefinitonListesi.add(yeniDefinitonNonconformity);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF021734),
        foregroundColor: Colors.white,
        title: const Text(
          'Field Surveillance Form',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final yeniWorkPermit = await Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => FieldSurveillanceFormPage()),
          );
          if (yeniWorkPermit != null) {
            yeniCalismaFormuEkle(yeniWorkPermit);
          }
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
        backgroundColor: Colors.deepOrange,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: DataTable(
            columns: [
              DataColumn(label: Text('Date')),
              DataColumn(label: Text('Definition of Nonconformity')),
              DataColumn(label: Text('Details')),
            ],
            rows: workDefinitonListesi.map((definitionNonconformity) {
              return DataRow(cells: [
                DataCell(Text(definitionNonconformity.workPermitTarihi)),
                DataCell(
                    Text(definitionNonconformity.workDefinitonNonconformity)),
                DataCell(ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              WorkPermitDetay(definitionNonconformity)),
                    );
                  },
                  child: Text('Details'),
                )),
              ]);
            }).toList(),
          ),
        ),
      ),
    );
  }
}

class FieldSurveillance {
  final String workPermitTarihi;
  final String workDefinitonNonconformity;

  FieldSurveillance(this.workPermitTarihi, this.workDefinitonNonconformity);
}

class YeniIsKazasiEkle extends StatefulWidget {
  @override
  _YeniIsKazasiEkleState createState() => _YeniIsKazasiEkleState();
}

class _YeniIsKazasiEkleState extends State<YeniIsKazasiEkle> {
  final TextEditingController tarihController = TextEditingController();
  final TextEditingController workPermitController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF021734),
        foregroundColor: Colors.white,
        title: Text(
          'Add New Work Permit Form',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: tarihController,
              decoration: InputDecoration(
                  labelText: 'Date of Definition of Nonconformity'),
            ),
            SizedBox(height: 16),
            TextFormField(
              controller: workPermitController,
              decoration:
                  InputDecoration(labelText: 'Definition of Nonconformity'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                final yeniNearMiss = FieldSurveillance(
                    tarihController.text, workPermitController.text);
                Navigator.pop(context, yeniNearMiss);
              },
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}

class WorkPermitDetay extends StatelessWidget {
  final FieldSurveillance definitionNonconformity;

  // ignore: prefer_const_constructors_in_immutables
  WorkPermitDetay(this.definitionNonconformity);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF021734),
        foregroundColor: Colors.white,
        title: Text(
          'Corrective Actions Details',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
                'Correctivete Actions Date: ${definitionNonconformity.workPermitTarihi}'),
            Text(
                'Correctivete State: ${definitionNonconformity.workDefinitonNonconformity}'),
          ],
        ),
      ),
    );
  }
}
