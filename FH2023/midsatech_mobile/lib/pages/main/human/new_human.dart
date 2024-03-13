import 'package:flutter/material.dart';
import 'package:midsatech_mobile/pages/main/human/model/human_model.dart';

class PersonelEklemeFormu extends StatefulWidget {
  final Function(Human) onPersonelEkle;

  PersonelEklemeFormu({required this.onPersonelEkle});

  @override
  _PersonelEklemeFormuState createState() => _PersonelEklemeFormuState();
}

class _PersonelEklemeFormuState extends State<PersonelEklemeFormu> {
  final _formKey = GlobalKey<FormState>();
  final adController = TextEditingController();
  final soyadController = TextEditingController();
  final departmanController = TextEditingController();
  final profilResmiUrlController = TextEditingController();

  @override
  void dispose() {
    adController.dispose();
    soyadController.dispose();
    departmanController.dispose();
    profilResmiUrlController.dispose();
    super.dispose();
  }

  void _kaydet() {
    if (_formKey.currentState!.validate()) {
      var yeniPersonel = Human(
        id: DateTime.now().toString(), // Basit bir ID oluşturma yöntemi
        name: adController.text,
        surname: soyadController.text,
        department: departmanController.text,
        profilResmiUrl: profilResmiUrlController.text,
      );
      widget.onPersonelEkle(yeniPersonel);
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Yeni Personel Ekle"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: adController,
                decoration: InputDecoration(labelText: 'Ad'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Lütfen bir ad girin';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: soyadController,
                decoration: InputDecoration(labelText: 'Soyad'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Lütfen bir soyad girin';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: departmanController,
                decoration: InputDecoration(labelText: 'Departman'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Lütfen bir departman girin';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: profilResmiUrlController,
                decoration: InputDecoration(labelText: 'Profil Resmi URL'),
                // Profil resmi URL'si opsiyonel olabilir
              ),
              ElevatedButton(
                onPressed: _kaydet,
                child: Text('Kaydet'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}