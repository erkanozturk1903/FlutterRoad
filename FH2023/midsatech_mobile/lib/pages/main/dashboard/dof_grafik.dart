// ignore_for_file: prefer_const_constructors_in_immutables, unused_local_variable

import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:midsatech_mobile/pages/main/work/corrective_actions/correvtive_list.dart';

class DofGrafik extends StatelessWidget {
  final List<Dof> dofListesi;

  // ignore: use_key_in_widget_constructors
  DofGrafik({required this.dofListesi});

  @override
  Widget build(BuildContext context) {
    return PieChart(
      PieChartData(
        sections: _getSections(),
        sectionsSpace: 0,
        centerSpaceRadius: 40,
      ),
    );
  }

  List<PieChartSectionData> _getSections() {
    Map<String, int> dofDurumu = {};

    // Kazaların nedenlerini say
    for (var dof in dofListesi) {
      dofDurumu[dof.dofDurumu] = (dofDurumu[dof.dofDurumu] ?? 0) + 1;
    }

    // Toplam dilim sayısını hesapla
    int totalSections = dofDurumu.length;

    // Pasta dilimlerini oluştur
    List<PieChartSectionData> sections = [];
    int index = 0;
    dofDurumu.forEach((neden, sayi) {
      // ignore: prefer_const_declarations
      final double fontSize = 12;
      const double radius = 120;
      //const double widgetSize = 60;
      const double textSize = 18;

      // Her dilimin yüzdesini hesapla

      double value = sayi.toDouble() / dofListesi.length * 100;

      sections.add(PieChartSectionData(
        color: _getRandomColor(index),
        value: value,
        title: '$neden\n$sayi',
        radius: radius,
        titleStyle: TextStyle(
          fontSize: fontSize,
          fontWeight: FontWeight.bold,
          color: const Color(0xffffffff),
        ),
        badgeWidget: Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.transparent,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                spreadRadius: 1,
                blurRadius: 2,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Text(
            '$value%',
            style: TextStyle(
              fontSize: textSize,
              fontWeight: FontWeight.bold,
              color: const Color(0xffffffff),
            ),
          ),
        ),
        badgePositionPercentageOffset: .93,
      ));
      index++;
    });

    return sections;
  }

  Color _getRandomColor(int index) {
    List<Color> colors = [
      Colors.blue,
      Colors.green,
      Colors.orange,
      Colors.red,
      Colors.purple,
      Colors.yellow,
      Colors.teal,
      Colors.indigo,
    ];

    return colors[index % colors.length];
  }
}
