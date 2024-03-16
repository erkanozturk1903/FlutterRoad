// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:midsatech_mobile/pages/main/work/corrective_actions/correctivite_form/correctivite_form.dart';

class CorrectiveActionsPage extends StatefulWidget {
  const CorrectiveActionsPage({super.key});

  @override
  State<CorrectiveActionsPage> createState() => _CorrectiveActionsPageState();
}

class _CorrectiveActionsPageState extends State<CorrectiveActionsPage> {
  List<Dof> dofListesi = [
    Dof('01.01.2021', 'Continues'),
    Dof('02.01.2021', 'Completed'),
    Dof('03.01.2021', 'Completed'),
    Dof('15.03.2024', 'Completed'),
    Dof('15.03.2024', 'Continues')
  ];

  void yeniIsKazasiEkle(Dof yeniDof) {
    setState(() {
      dofListesi.add(yeniDof);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF021734),
        foregroundColor: Colors.white,
        title: const Text(
          'Corrective Preventive Actions',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final yeniDof = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CorrectiviteFormPage()),
          );
          if (yeniDof != null) {
            yeniIsKazasiEkle(yeniDof);
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
              DataColumn(label: Text('Cause of Accident')),
              DataColumn(label: Text('Details')),
            ],
            rows: dofListesi.map((dof) {
              return DataRow(cells: [
                DataCell(Text(dof.dofTarihi)),
                DataCell(Text(dof.dofDurumu)),
                DataCell(ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DofDetay(dof)),
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

class Dof {
  final String dofTarihi;
  final String dofDurumu;

  Dof(this.dofTarihi, this.dofDurumu);
}

class YeniIsKazasiEkle extends StatefulWidget {
  @override
  _YeniIsKazasiEkleState createState() => _YeniIsKazasiEkleState();
}

class _YeniIsKazasiEkleState extends State<YeniIsKazasiEkle> {
  final TextEditingController tarihController = TextEditingController();
  final TextEditingController yaralanmaTuruController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF021734),
        foregroundColor: Colors.white,
        title: Text(
          'Add New Work Accident',
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
              decoration: InputDecoration(labelText: 'Date of Work Accident'),
            ),
            SizedBox(height: 16),
            TextFormField(
              controller: yaralanmaTuruController,
              decoration: InputDecoration(labelText: 'Injury Type'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                final yeniIsKazasi =
                    Dof(tarihController.text, yaralanmaTuruController.text);
                Navigator.pop(context, yeniIsKazasi);
              },
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}

class DofDetay extends StatelessWidget {
  final Dof dof;

  DofDetay(this.dof);

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
            Text('Correctivete Actions Date: ${dof.dofTarihi}'),
            Text('Correctivete State: ${dof.dofDurumu}'),
          ],
        ),
      ),
    );
  }
}
