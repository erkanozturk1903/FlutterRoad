// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:midsatech_mobile/pages/main/work/work_accident/work_accident.dart';

class IsKazasiListesi extends StatefulWidget {
  const IsKazasiListesi({super.key});

  @override
  State<IsKazasiListesi> createState() => _IsKazasiListesiState();
}

class _IsKazasiListesiState extends State<IsKazasiListesi> {
  List<IsKazasi> isKazasiListesi = [
    IsKazasi('01.01.2021', 'Kayma'),
    IsKazasi('02.01.2021', 'Düşme'),
    IsKazasi('03.01.2021', 'Kayma'),
    IsKazasi('15.03.2024', 'Trafik Kazası'),
    IsKazasi('15.03.2024', 'Yüksekten Düşme')
  ];

  void yeniIsKazasiEkle(IsKazasi yeniIsKazasi) {
    setState(() {
      isKazasiListesi.add(yeniIsKazasi);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF021734),
        foregroundColor: Colors.white,
        title: const Text(
          'Work Accident List',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final yeniIsKazasi = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => IsKazasiFormPage()),
          );
          if (yeniIsKazasi != null) {
            yeniIsKazasiEkle(yeniIsKazasi);
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
            rows: isKazasiListesi.map((isKazasi) {
              return DataRow(cells: [
                DataCell(Text(isKazasi.tarih)),
                DataCell(Text(isKazasi.yaralanmaTuru)),
                DataCell(ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => IsKazasiDetay(isKazasi)),
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

class IsKazasi {
  final String tarih;
  final String yaralanmaTuru;

  IsKazasi(this.tarih, this.yaralanmaTuru);
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
                final yeniIsKazasi = IsKazasi(
                    tarihController.text, yaralanmaTuruController.text);
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

class IsKazasiDetay extends StatelessWidget {
  final IsKazasi isKazasi;

  IsKazasiDetay(this.isKazasi);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF021734),
        foregroundColor: Colors.white,
        title: Text(
          'İş Kazası Detayı',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('İş Kazası Tarihi: ${isKazasi.tarih}'),
            Text('Yaralanma Türü: ${isKazasi.yaralanmaTuru}'),
          ],
        ),
      ),
    );
  }
}
