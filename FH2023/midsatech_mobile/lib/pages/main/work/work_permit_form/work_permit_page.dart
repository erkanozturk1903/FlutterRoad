// ignore_for_file: prefer_const_literals_to_create_immutables, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:midsatech_mobile/pages/main/work/work_permit_form/pages/work_permit_form.dart';

class WorkPermitPage extends StatefulWidget {
  const WorkPermitPage({super.key});

  @override
  State<WorkPermitPage> createState() => _WorkPermitPageState();
}

class _WorkPermitPageState extends State<WorkPermitPage> {
  List<WorkPermit> workPermitListesi = [
    WorkPermit('01.01.2024', 'Working at Height'),
    WorkPermit('02.01.2021', 'Working in Confined Spaces'),
    WorkPermit('03.01.2021', 'Working with Lifting Equipment'),
  ];

  void yeniCalismaFormuEkle(WorkPermit yeniWorkPermit) {
    setState(() {
      workPermitListesi.add(yeniWorkPermit);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF021734),
        foregroundColor: Colors.white,
        title: const Text(
          'Work Permit Form',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final yeniWorkPermit = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => WorkPermitFormPage()),
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
              DataColumn(label: Text('Permit Type')),
              DataColumn(label: Text('Details')),
            ],
            rows: workPermitListesi.map((workPermit) {
              return DataRow(cells: [
                DataCell(Text(workPermit.workPermitTarihi)),
                DataCell(Text(workPermit.workPertmitType)),
                DataCell(ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => WorkPermitDetay(workPermit)),
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

class WorkPermit {
  final String workPermitTarihi;
  final String workPertmitType;

  WorkPermit(this.workPermitTarihi, this.workPertmitType);
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
              decoration: InputDecoration(labelText: 'Date of Near Miss'),
            ),
            SizedBox(height: 16),
            TextFormField(
              controller: workPermitController,
              decoration: InputDecoration(labelText: 'Work Permit Type'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                final yeniNearMiss =
                    WorkPermit(tarihController.text, workPermitController.text);
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
  final WorkPermit workPermit;

  // ignore: prefer_const_constructors_in_immutables
  WorkPermitDetay(this.workPermit);

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
            Text('Correctivete Actions Date: ${workPermit.workPermitTarihi}'),
            Text('Correctivete State: ${workPermit.workPertmitType}'),
          ],
        ),
      ),
    );
  }
}
