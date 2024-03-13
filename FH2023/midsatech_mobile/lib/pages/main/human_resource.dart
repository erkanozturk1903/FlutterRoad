import 'package:flutter/material.dart';
import 'package:midsatech_mobile/pages/main/human/human_details.dart';
import 'package:midsatech_mobile/pages/main/human/model/human_model.dart';
import 'package:midsatech_mobile/pages/main/human/new_human.dart';

class HumanPage extends StatefulWidget {
  @override
  _HumanPageState createState() => _HumanPageState();
}

class _HumanPageState extends State<HumanPage> {
  List<Human> humans = [
    Human(id: "1", name: "A.Levent", surname: "Bahadıroğlu", department: "IT"),
    Human(id: "2", name: "Erkan", surname: "Öztürk", department: "IT"),
    Human(id: "3", name: "Ekin", surname: "Uğur", department: "IT"),
    // Daha fazla personel ekleyebilirsiniz.
  ];
  void _yeniPersonelEkle() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => PersonelEklemeFormu(
          onPersonelEkle: (yeniPersonel) {
            setState(() {
              humans.add(yeniPersonel);
            });
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Human Resource'),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
          columns: const [
            DataColumn(label: Text('Ad')),
            DataColumn(label: Text('Soyad')),
            //DataColumn(label: Text('Departman')),
            DataColumn(label: Text('Aksiyon')), // Detay butonu için sütun
          ],
          rows: humans
              .map(
                (human) => DataRow(
                  cells: [
                    DataCell(Text(human.name)),
                    DataCell(Text(human.surname)),
                    //DataCell(Text(human.department)),
                    DataCell(Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HumanDetails(
                                human: human,
                              ),
                            ),
                          );
                        },
                        child: const Text('Details'),
                      ),
                    )),
                  ],
                ),
              )
              .toList(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepOrangeAccent,

        onPressed: _yeniPersonelEkle,
        tooltip: 'Personel Ekle',
        child:const Icon(Icons.add,color: Colors.white,),
      ),
    );
  }
}
