import 'package:flutter/material.dart';
import 'package:midsatech_mobile/pages/main/dashboard/dof_grafik.dart';
import 'package:midsatech_mobile/pages/main/dashboard/iskazalistesi_grafik.dart';
import 'package:midsatech_mobile/pages/main/work/corrective_actions/correvtive_list.dart';
import 'package:midsatech_mobile/pages/main/work/work_accident/is_kazasi.dart';

class DashboardPage extends StatefulWidget {
  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final List<IsKazasi> isKazasiListesi = [
    IsKazasi('02.01.2021', 'Fall'),
    IsKazasi('01.01.2021', 'Slip'),
    IsKazasi('02.01.2021', 'Falling From High'),
    IsKazasi('15.03.2024', 'Traffic Accident'),
    IsKazasi('15.03.2024', 'Falling From High')
  ];

  List<Dof> dofListesi = [
    Dof('01.01.2021', 'Continues'),
    Dof('02.01.2021', 'Completed'),
    Dof('03.01.2021', 'Completed'),
    Dof('15.03.2024', 'Completed'),
    Dof('15.03.2024', 'Continues')
  ];
  // Örnek iş kazası listesi
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            Text(
              'Work Accident List',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Container(
              height: 300, // İstediğiniz yüksekliği ayarlayın
              width: double.infinity, // Genişliği tam olarak doldurmak için
              child: IsKazasiListesiGrafik(isKazasiListesi: isKazasiListesi),
            ),
            SizedBox(height: 20),
            Text(
              'Corrective Actions List',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Container(
              height: 300, // İstediğiniz yüksekliği ayarlayın
              width: double.infinity, // Genişliği tam olarak doldurmak için
              child: DofGrafik(dofListesi: dofListesi),
            ),
          ],
        ),
      ),
    );
  }
}
