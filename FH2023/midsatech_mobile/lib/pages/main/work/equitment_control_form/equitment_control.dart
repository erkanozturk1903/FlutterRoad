// ignore_for_file: prefer_const_literals_to_create_immutables, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:midsatech_mobile/pages/main/work/equitment_control_form/equitment_control_form/equitment_form.dart';

class EquitmentControlFormPage extends StatefulWidget {
  const EquitmentControlFormPage({super.key});

  @override
  State<EquitmentControlFormPage> createState() =>
      _EquitmentControlFormPageState();
}

class _EquitmentControlFormPageState extends State<EquitmentControlFormPage> {
  List<EquitmentControl> equitmentControlListesi = [
    EquitmentControl('01.01.2024', 'General Checklist'),
  ];

  void yeniCalismaFormuEkle(EquitmentControl yeniEuipmentControl) {
    setState(() {
      equitmentControlListesi.add(yeniEuipmentControl);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF021734),
        foregroundColor: Colors.white,
        title: const Text(
          'Equipment Control Form',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final yeniEuipmentControl = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => EquitmentControlForm()),
          );
          if (yeniEuipmentControl != null) {
            yeniCalismaFormuEkle(yeniEuipmentControl);
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
              DataColumn(label: Text('Control Form Type')),
              DataColumn(label: Text('Details')),
            ],
            rows: equitmentControlListesi.map((equitment) {
              return DataRow(cells: [
                DataCell(Text(equitment.equitmentControlTarihi)),
                DataCell(Text(equitment.equitmentControlFormType)),
                DataCell(ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              EquitmentControlDetay(equitment)),
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

class EquitmentControl {
  final String equitmentControlTarihi;
  final String equitmentControlFormType;

  EquitmentControl(this.equitmentControlTarihi, this.equitmentControlFormType);
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
                final yeniNearMiss = EquitmentControl(
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

class EquitmentControlDetay extends StatelessWidget {
  final EquitmentControl equitmentControl;

  // ignore: prefer_const_constructors_in_immutables
  EquitmentControlDetay(this.equitmentControl);

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
                'Equitment Control Date: ${equitmentControl.equitmentControlTarihi}'),
            Text(
                'Equitment Checklist: ${equitmentControl.equitmentControlFormType}'),
          ],
        ),
      ),
    );
  }
}
