import 'package:flutter/material.dart';
import 'package:midsatech_mobile/pages/main/human/human_details.dart';
import 'package:midsatech_mobile/pages/main/human/model/human_model.dart';
import 'package:midsatech_mobile/pages/main/human/new_human.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HumanPage extends StatefulWidget {
  @override
  _HumanPageState createState() => _HumanPageState();
}

class _HumanPageState extends State<HumanPage> {
  List<Human> humans = [];

  // Firestore'dan verileri almak için method
  void _fetchHumans() async {
    final QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection('midsatech')
        .doc('customers')
        .collection('users')
        .get();

    final List<Human> fetchedHumans = [];

    // Veritabanından gelen belgeleri kontrol et
    if (snapshot.docs.isNotEmpty) {
      snapshot.docs.forEach((doc) {
        final humanData = doc.data() as Map<String, dynamic>?;

        if (humanData != null) {
          final human = Human.fromMap(humanData);
          fetchedHumans.add(human);
        }
      });
    } else {
      // Veritabanından herhangi bir belge yoksa veya belgeler boşsa
      print('Veritabanında personel bulunamadı.');
      // Burada isterseniz bir hata mesajı gösterebilir veya başka bir işlem yapabilirsiniz.
    }

    setState(() {
      humans = fetchedHumans;
    });
  }

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
  void initState() {
    super.initState();
    _fetchHumans(); // Sayfa ilk oluşturulduğunda Firebase'den verileri al
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
            DataColumn(label: Text('Name')),
            DataColumn(label: Text('Surname')),
            DataColumn(label: Text('Details')), // Detay butonu için sütun
          ],
          rows: humans
              .map(
                (human) => DataRow(
                  cells: [
                    DataCell(Text(human.name)),
                    DataCell(Text(human.surname)),
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
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
