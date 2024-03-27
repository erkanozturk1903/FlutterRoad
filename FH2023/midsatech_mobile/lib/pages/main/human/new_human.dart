import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:midsatech_mobile/pages/main/human/model/human_model.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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

      // Firestore'a yeni kullanıcıyı eklemek için
      FirebaseFirestore.instance
          .collection('midsatech')
          .doc('customers')
          .collection('administrator')
          .doc('human')
          .collection('personel')
          .add(yeniPersonel.toMap());

      widget.onPersonelEkle(yeniPersonel);
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("add_new_staff".tr),
        backgroundColor: const Color(0xFF021734),
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              SizedBox(height: 16.0),
              buildTextFormField(controller: adController, label: 'name'.tr),
              SizedBox(height: 16.0),
              buildTextFormField(
                  controller: soyadController, label: 'surname'.tr),
              SizedBox(height: 16.0),
              buildTextFormField(
                  controller: departmanController, label: 'department'.tr),
              SizedBox(height: 16.0),
              buildTextFormField(
                  controller: cinsiyetController, label: 'gender'.tr),
              SizedBox(height: 16.0),
              buildTextFormField(
                  controller: emailController, label: 'email'.tr),
              SizedBox(height: 16.0),
              buildTextFormField(
                  controller: telefonNumarasiController, label: 'phone'.tr),
              SizedBox(height: 16.0),
              buildTextFormField(
                  controller: adresController, label: 'address'.tr),
              SizedBox(height: 16.0),
              buildTextFormField(
                  controller: dogumTarihiController, label: 'birth_date'.tr),
              SizedBox(height: 16.0),
              buildTextFormField(
                  controller: dogumYeriController, label: 'birth_place'.tr),
              SizedBox(height: 16.0),
              buildTextFormField(
                  controller: egitimController, label: 'education'.tr),
              SizedBox(height: 16.0),
              buildTextFormField(
                  controller: kanGrubuController, label: 'blood_type'.tr),
              SizedBox(height: 16.0),
              buildTextFormField(
                  controller: medeniDurumController,
                  label: 'marital_status'.tr),
              SizedBox(height: 16.0),
              buildTextFormField(controller: isController, label: 'job'.tr),
              SizedBox(height: 16.0),
              /*  ElevatedButton(
                onPressed: _profilResmiSec,
                child: Text('select_profile_picture'.tr),
              ), */
              SizedBox(height: 16.0),
              if (profilResmiUrl != null)
                Image.network(
                  profilResmiUrl!,
                  height: 200,
                  width: 200,
                  fit: BoxFit.cover,
                ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: _kaydet,
                child: Text('save'.tr),
              ),
              SizedBox(height: 16.0),
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
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please $label fill in all fields all';
        }
        return null;
      },
    );
  }
}
