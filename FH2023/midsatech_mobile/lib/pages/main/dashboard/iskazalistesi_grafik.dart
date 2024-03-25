// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class IsKazasiListesiGrafik extends StatelessWidget {
  //final List<IsKazasi> isKazasiListesi;

  // ignore: use_key_in_widget_constructors

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
    Map<String, int> kazalarinNedenleri = {};

    // Kazaların nedenlerini say
    /*   for (var kaza in isKazasiListesi) {
      kazalarinNedenleri[kaza.yaralanmaTuru] =
          (kazalarinNedenleri[kaza.yaralanmaTuru] ?? 0) + 1;
    } */

    // Toplam dilim sayısını hesapla
    int totalSections = kazalarinNedenleri.length;

    // Pasta dilimlerini oluştur
    List<PieChartSectionData> sections = [];
    int index = 0;
    kazalarinNedenleri.forEach((neden, sayi) {
      // ignore: prefer_const_declarations
      final double fontSize = 12;
      const double radius = 120;
      //const double widgetSize = 60;
      const double textSize = 18;

      // Her dilimin yüzdesini hesapla
      //double value = sayi.toDouble() / isKazasiListesi.length * 100;

      sections.add(PieChartSectionData(
        color: _getRandomColor(index),
        //value: value,
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
            '%',
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
