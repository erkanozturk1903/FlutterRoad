// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:midsatech_mobile/pages/main/work/work_accident/is_kazasi.dart';

class SafetyPage extends StatefulWidget {
  @override
  State<SafetyPage> createState() => _SafetyPageState();
}

class _SafetyPageState extends State<SafetyPage> {
  final List<CardInfo> cards = [
    CardInfo(
      name: 'Work Accident Form',
      icon: Icons.personal_injury_outlined,
      colors: [Colors.blue.shade500, Colors.blue.shade700],
      iconColor: Colors.white,
      destination: IsKazasiListesi(),
    ),
    CardInfo(
      name: 'Corrective Preventive Actions',
      icon: Icons.assignment_turned_in_outlined,
      colors: [Colors.green.shade600, Colors.lightGreen.shade500],
      iconColor: Colors.white,
      destination: IsKazasiListesi(),
    ),
    CardInfo(
      name: 'Near Miss Form',
      icon: Icons.warning_amber_outlined,
      colors: [Colors.orange.shade700, Colors.amber.shade600],
      iconColor: Colors.white,
      destination: IsKazasiListesi(),
    ),
    CardInfo(
      name: 'Work Permit Form',
      icon: Icons.home_work_outlined,
      colors: [Colors.purple.shade500, Colors.purple.shade700],
      iconColor: Colors.white,
      destination: IsKazasiListesi(),
    ),
    CardInfo(
      name: 'Field Inspection Form',
      icon: Icons.search_outlined,
      colors: [Colors.red.shade600, Colors.red.shade800],
      iconColor: Colors.white,
      destination: IsKazasiListesi(),
    ),
    CardInfo(
      name: 'Equipment Control Form',
      icon: Icons.build_circle_outlined,
      colors: [Colors.teal.shade500, Colors.tealAccent.shade700],
      iconColor: Colors.white,
      destination: IsKazasiListesi(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1.0,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        padding: EdgeInsets.all(10),
        itemCount: cards.length,
        itemBuilder: (context, index) {
          return CustomCardItem(
            name: cards[index].name,
            icon: cards[index].icon,
            colors: cards[index].colors,
            iconColor: cards[index].iconColor,
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => cards[index].destination),
            ),
          );
        },
      ),
    );
  }
}

class CardInfo {
  final String name;
  final IconData icon;
  final List<Color> colors;
  final Color iconColor;
  final Widget destination;

  CardInfo({
    required this.name,
    required this.icon,
    required this.colors,
    required this.iconColor,
    required this.destination,
  });
}

class CustomCardItem extends StatelessWidget {
  final String name;
  final IconData icon;
  final List<Color> colors;
  final Color iconColor;
  final VoidCallback onTap;

  const CustomCardItem({
    Key? key,
    required this.name,
    required this.icon,
    required this.colors,
    required this.iconColor,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: LinearGradient(
              colors: colors,
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(icon, size: 50, color: iconColor),
              Text(
                name,
                style: TextStyle(
                  color: iconColor,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
