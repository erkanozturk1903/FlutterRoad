// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:multistore_app/minor_screen/subcateg_products.dart';

class SliderBar extends StatelessWidget {
  final String maincategName;
  const SliderBar({
    super.key,
    required this.maincategName,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.8,
      width: MediaQuery.of(context).size.width * 0.05,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 40.0),
        child: Container(
            decoration: BoxDecoration(
              color: Colors.brown.withOpacity(0.2),
              borderRadius: BorderRadius.circular(50),
            ),
            child: RotatedBox(
              quarterTurns: 3,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    ' << ',
                    style: TextStyle(
                      color: Colors.brown,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 10,
                    ),
                  ),
                  Text(
                    maincategName.toUpperCase(),
                    style: TextStyle(
                      color: Colors.brown,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 10,
                    ),
                  ),
                  Text(
                    ' >> ',
                    style: TextStyle(
                      color: Colors.brown,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 10,
                    ),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}

class SubcategModel extends StatelessWidget {
  final String mainCategName;
  final String subCategName;
  final String assetName;
  final String subcategLabel;
  const SubcategModel({
    super.key,
    required this.mainCategName,
    required this.subCategName,
    required this.assetName,
    required this.subcategLabel,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SubCategProduct(
              maincategName: mainCategName,
              subcategName: subCategName,
            ),
          ),
        );
      },
      child: Column(
        children: [
          SizedBox(
            height: 65,
            width: 65,
            child: Image(
              image: AssetImage(assetName),
            ),
          ),
          Text(subcategLabel),
        ],
      ),
    );
  }
}

class CategHeaderLabel extends StatelessWidget {
  final String headerLabel;
  const CategHeaderLabel({
    super.key,
    required this.headerLabel,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(30.0),
      child: Text(
        headerLabel,
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          letterSpacing: 1.5,
        ),
      ),
    );
  }
}
