// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:multistore_app/utilities/categ_list.dart';
import 'package:multistore_app/widget/categ_widget.dart';

class BeautyCategory extends StatelessWidget {
  const BeautyCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            left: 0,
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.8,
              width: MediaQuery.of(context).size.width * 0.75,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CategHeaderLabel(
                    headerLabel: 'Beauty',
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.68,
                    child: GridView.count(
                      mainAxisSpacing: 70,
                      crossAxisSpacing: 15,
                      crossAxisCount: 3,
                      children: List.generate(beauty.length, (index) {
                        return SubcategModel(
                          mainCategName: 'beauty',
                          subCategName: beauty[index],
                          assetName: 'images/beauty/beauty$index.jpg',
                          subcategLabel: beauty[index],
                        );
                      }),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: SliderBar(
              maincategName: 'beauty',
            ),
          ),
        ],
      ),
    );
  }
}
