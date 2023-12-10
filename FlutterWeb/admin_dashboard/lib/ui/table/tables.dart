// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class DataTables extends StatefulWidget {
  const DataTables({super.key});

  @override
  State<DataTables> createState() => _DataTablesState();
}

class _DataTablesState extends State<DataTables> {
  static const int numItems = 20;
  List<bool> selected = List<bool>.generate(numItems, (int index) => false);
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: DataTable(columns: const <DataColumn>[
        DataColumn(
          label: Expanded(
            child: Text(
              'Adı',
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
          ),
        ),
        DataColumn(
          label: Expanded(
            child: Text(
              'Yaşı',
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
          ),
        ),
        DataColumn(
          label: Expanded(
            child: Text(
              'Görevi',
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
          ),
        ),
      ], rows: <DataRow>[
        DataRow(
          selected: selected[0],
          cells: <DataCell>[
            DataCell(Text('Ekin')),
            DataCell(Text('37')),
            DataCell(Text('Finans')),
          ],
        ),
        DataRow(
          selected: selected[1],
          cells: <DataCell>[
            DataCell(Text('Erkan')),
            DataCell(Text('42')),
            DataCell(Text('Developer')),
          ],
        ),
        DataRow(
          selected: selected[2],
          cells: <DataCell>[
            DataCell(Text('Levent Abi')),
            DataCell(Text('54')),
            DataCell(Text('Pazarlamacı')),
          ],
        ),
      ]),
    );
  }
}
