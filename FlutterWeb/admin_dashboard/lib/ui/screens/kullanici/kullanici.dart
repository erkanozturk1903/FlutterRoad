// ignore_for_file: prefer_const_constructors

import 'package:admin_dashboard/ui/buttons/add_delete_buttons.dart';
import 'package:admin_dashboard/ui/label/custom_labels.dart';
import 'package:admin_dashboard/ui/table/tables.dart';
import 'package:flutter/material.dart';

class KullaniciScreen extends StatelessWidget {
  const KullaniciScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        physics: const ClampingScrollPhysics(),
        children: [
          Text(
            "Kullanici Ekranı",
            style: CustomLabels.h1,
          ),
          const SizedBox(
            height: 10,
          ),
          //TablesPage()
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              AddDeleteButtons(
                text: "Ekle",
                onPressed: () {},
                color: Colors.green,
              ),
              const SizedBox(
                width: 10,
              ),
              AddDeleteButtons(
                text: "Düzenle",
                onPressed: () {},
                color: Colors.orange,
              ),
              const SizedBox(
                width: 10,
              ),
              AddDeleteButtons(
                text: "Sil",
                onPressed: () {},
                color: Colors.red,
              ),
            ],
          ),
          DataTables()
        ],
      ),
    );
  }
}
