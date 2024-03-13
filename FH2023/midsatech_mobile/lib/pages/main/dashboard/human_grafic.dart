import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class DepartmanGrafik extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: const Text("Departmanlara Göre Personel Sayısı", style: TextStyle(fontSize: 13),),
      ),
      body: Center(
        child: BarChart(
          BarChartData(
            alignment: BarChartAlignment.spaceAround,
            maxY: 10, // Maksimum personel sayısını temsil eder, gerektiği gibi ayarlayın
            barTouchData: BarTouchData(
              enabled: false,
            ),
            titlesData: FlTitlesData(
              show: true,
              bottomTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  reservedSize: 40,
                  getTitlesWidget: (double value, TitleMeta meta) {
                    const style = TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    );
                    String text;
                    switch (value.toInt()) {
                      case 0:
                        text = 'IT';
                        break;
                      case 1:
                        text = 'Muhasebe';
                        break;
                      case 2:
                        text = 'İK';
                        break;
                      case 3:
                        text = 'Pazarlama';
                        break;
                      default:
                        text = '';
                        break;
                    }
                    return SideTitleWidget(
                      axisSide: meta.axisSide,
                      space: 16, // Margin from the axis line
                      child: Text(text, style: style),
                    );
                  },
                ),
              ),
              topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
              rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
              leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            ),
            gridData: FlGridData(show: false),
            borderData: FlBorderData(show: false),
            barGroups: [
              BarChartGroupData(x: 0, barRods: [BarChartRodData(toY: 8, color: Colors.lightBlue)]), // IT
              BarChartGroupData(x: 1, barRods: [BarChartRodData(toY: 5, color: Colors.lightGreen)]), // Muhasebe
              BarChartGroupData(x: 2, barRods: [BarChartRodData(toY: 3, color: Colors.pink)]), // İK
              BarChartGroupData(x: 3, barRods: [BarChartRodData(toY: 4, color: Colors.orange)]), // Pazarlama
            ],
          ),
        ),
      ),
    );
  }
}