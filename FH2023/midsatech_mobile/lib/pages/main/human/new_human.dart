// ignore_for_file: no_leading_underscores_for_local_identifiers, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:midsatech_mobile/pages/main/human/model/human_model.dart';
import 'package:image_picker/image_picker.dart';

class PersonelEklemeFormu extends StatefulWidget {
  final Function(Human) onPersonelEkle;

  const PersonelEklemeFormu({Key? key, required this.onPersonelEkle})
      : super(key: key);

  @override
  _PersonelEklemeFormuState createState() => _PersonelEklemeFormuState();
}

class _PersonelEklemeFormuState extends State<PersonelEklemeFormu> {
  final _formKey = GlobalKey<FormState>();
  final adController = TextEditingController();
  final soyadController = TextEditingController();
  final departmanController = TextEditingController();
  final cinsiyetController = TextEditingController();
  final emailController = TextEditingController();
  final telefonNumarasiController = TextEditingController();
  final adresController = TextEditingController();
  final dogumTarihiController = TextEditingController();
  final dogumYeriController = TextEditingController();
  final egitimController = TextEditingController();
  final kanGrubuController = TextEditingController();
  final medeniDurumController = TextEditingController();
  final isController = TextEditingController();
  String? profilResmiUrl; // Null olabilir

  @override
  void dispose() {
    adController.dispose();
    soyadController.dispose();
    departmanController.dispose();
    cinsiyetController.dispose();
    emailController.dispose();
    telefonNumarasiController.dispose();
    adresController.dispose();
    dogumTarihiController.dispose();
    dogumYeriController.dispose();
    egitimController.dispose();
    kanGrubuController.dispose();
    medeniDurumController.dispose();
    isController.dispose();
    super.dispose();
  }

  Future<void> _profilResmiSec() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    setState(() {
      profilResmiUrl = image?.path; // Dosya yolunu kaydet
    });
  }

  void _kaydet() {
    if (_formKey.currentState!.validate()) {
      var yeniPersonel = Human(
        id: DateTime.now().toString(),
        name: adController.text,
        surname: soyadController.text,
        department: departmanController.text,
        gender: cinsiyetController.text,
        email: emailController.text,
        phoneNumber: telefonNumarasiController.text,
        address: adresController.text,
        birthDate: dogumTarihiController.text,
        birthPlace: dogumYeriController.text,
        education: egitimController.text,
        bloodType: kanGrubuController.text,
        maritalStatus: medeniDurumController.text,
        jobs: isController.text,
        profilResmiUrl: profilResmiUrl ?? "", // Null kontrolü
      );
      widget.onPersonelEkle(yeniPersonel);
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Yeni Personel Ekle"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              // Her alan için TextFormField widget'ları
              buildTextFormField(controller: adController, label: 'Name'),
              buildTextFormField(controller: soyadController, label: 'Surname'),
              buildTextFormField(
                  controller: departmanController, label: 'Department'),
              buildTextFormField(
                  controller: cinsiyetController, label: 'Gender'),
              buildTextFormField(controller: emailController, label: 'E-Mail'),
              buildTextFormField(
                  controller: telefonNumarasiController, label: 'Phone Number'),
              buildTextFormField(controller: adresController, label: 'Address'),
              buildTextFormField(
                  controller: dogumTarihiController, label: 'Birth Date'),
              buildTextFormField(
                  controller: dogumYeriController, label: 'Birth Place'),
              buildTextFormField(
                  controller: egitimController, label: 'Education'),
              buildTextFormField(
                  controller: kanGrubuController, label: 'Blood Type'),
              buildTextFormField(
                  controller: medeniDurumController, label: 'Marital Status'),
              buildTextFormField(controller: isController, label: 'Jobs'),
              if (profilResmiUrl != null) Image.network(profilResmiUrl!),
              ElevatedButton(
                onPressed: _profilResmiSec,
                child: const Text('Profil Resmi Seç'),
              ),
              ElevatedButton(
                onPressed: _kaydet,
                child: const Text('Kaydet'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  TextFormField buildTextFormField(
      {required TextEditingController controller, required String label}) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(labelText: label),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Lütfen $label alanını doldurun';
        }
        return null;
      },
    );
  }
}
