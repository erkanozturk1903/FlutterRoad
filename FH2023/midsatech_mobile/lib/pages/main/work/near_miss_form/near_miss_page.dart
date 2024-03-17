// ignore_for_file: prefer_const_literals_to_create_immutables, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:midsatech_mobile/pages/main/work/near_miss_form/page/near_miss_form.dart';

class NearMissPage extends StatefulWidget {
  const NearMissPage({super.key});

  @override
  State<NearMissPage> createState() => _NearMissPageState();
}

class _NearMissPageState extends State<NearMissPage> {
  List<NearMiss> nearMissListesi = [
    NearMiss('01.01.2024', 'Production'),
    NearMiss('02.01.2021', 'Stairs'),
    NearMiss('03.01.2021', 'Toilet'),
    NearMiss('15.03.2024', 'Dining Hall'),
  ];

  void yeniIsKazasiEkle(NearMiss yeniNearMiss) {
    setState(() {
      nearMissListesi.add(yeniNearMiss);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF021734),
        foregroundColor: Colors.white,
        title: const Text(
          'Near Miss Actions',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final yeniNearMiss = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => NearMissFormPage()),
          );
          if (yeniNearMiss != null) {
            yeniIsKazasiEkle(yeniNearMiss);
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
              DataColumn(label: Text('Section')),
              DataColumn(label: Text('Details')),
            ],
            rows: nearMissListesi.map((nearMiis) {
              return DataRow(cells: [
                DataCell(Text(nearMiis.nearMissTarihi)),
                DataCell(Text(nearMiis.nearMissSection)),
                DataCell(ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => NearMissDetay(nearMiis)),
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

class NearMiss {
  final String nearMissTarihi;
  final String nearMissSection;

  NearMiss(this.nearMissTarihi, this.nearMissSection);
}

class YeniIsKazasiEkle extends StatefulWidget {
  @override
  _YeniIsKazasiEkleState createState() => _YeniIsKazasiEkleState();
}

class _YeniIsKazasiEkleState extends State<YeniIsKazasiEkle> {
  final TextEditingController tarihController = TextEditingController();
  final TextEditingController nearMissController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF021734),
        foregroundColor: Colors.white,
        title: Text(
          'Add New Near Miss',
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
              controller: nearMissController,
              decoration: InputDecoration(labelText: 'Section of Near Miss'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                final yeniNearMiss =
                    NearMiss(tarihController.text, nearMissController.text);
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

class NearMissDetay extends StatelessWidget {
  final NearMiss nearMiss;

  // ignore: prefer_const_constructors_in_immutables
  NearMissDetay(this.nearMiss);

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
            Text('Correctivete Actions Date: ${nearMiss.nearMissTarihi}'),
            Text('Correctivete State: ${nearMiss.nearMissSection}'),
          ],
        ),
      ),
    );
  }
}
