// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:midsatech_mobile/pages/main/work/work_accident/models/is_kazasi_model.dart';

class IsKazasiFormPage extends StatefulWidget {
  @override
  _IsKazasiFormPageState createState() => _IsKazasiFormPageState();
}

class _IsKazasiFormPageState extends State<IsKazasiFormPage> {
  final _formKey = GlobalKey<FormState>();
  int _currentStep = 0;

  // Form için gerekli değişkenler
  String? _isYeriAdi;
  String? _kazaYeri;
  DateTime? _tarih;
  TimeOfDay? _saat;
  KazaOlayTuru? _kazaOlayTuru;
  EtkilenenBolge? _etkilenenBolge;
  KazaNedeniTipi? _kazaNedeniTipi;
  List<String> _kazaNedeniDetaylar = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF021734),
        foregroundColor: Colors.white,
        title: const Text(
          'Work Accident Form',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Stepper(
        type: StepperType.vertical,
        currentStep: _currentStep,
        onStepContinue: _currentStep < _getSteps().length - 1
            ? () => setState(() => _currentStep += 1)
            : null,
        onStepCancel:
            _currentStep > 0 ? () => setState(() => _currentStep -= 1) : null,
        steps: _getSteps(),
      ),
    );
  }

  List<Step> _getSteps() {
    return [
      Step(
        title: Text('Genel Bilgiler'),
        content: _generalInformationForm(),
        isActive: _currentStep >= 0,
        state: _currentStep > 0 ? StepState.complete : StepState.indexed,
      ),
      Step(
        title: Text('Kaza Detayları'),
        content: _accidentDetailsForm(),
        isActive: _currentStep >= 1,
        state: _currentStep > 1 ? StepState.complete : StepState.indexed,
      ),
      Step(
        title: Text('Kaza Sonrası İşlemler'),
        content: _postAccidentActionsForm(),
        isActive: _currentStep >= 2,
        state: _currentStep > 2 ? StepState.complete : StepState.indexed,
      ),
    ];
  }

  Widget _generalInformationForm() {
    return Column(
      children: [
        TextFormField(
          decoration: InputDecoration(labelText: 'İş Yeri Adı'),
          onSaved: (value) => _isYeriAdi = value,
        ),
        TextFormField(
          decoration: InputDecoration(labelText: 'Kaza Yeri'),
          onSaved: (value) => _kazaYeri = value,
        ),
        // Tarih seçici
        ListTile(
          title: Text(
              'Tarih: ${_tarih != null ? DateFormat('yyyy-MM-dd').format(_tarih!) : 'Seçilmedi'}'),
          onTap: () async {
            DateTime? picked = await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(2000),
              lastDate: DateTime(2025),
            );
            if (picked != null && picked != _tarih) {
              setState(() => _tarih = picked);
            }
          },
        ),
        // Saat seçici
        ListTile(
          title: Text(
              'Saat: ${_saat != null ? _saat!.format(context) : 'Seçilmedi'}'),
          onTap: () async {
            TimeOfDay? picked = await showTimePicker(
              context: context,
              initialTime: TimeOfDay.now(),
            );
            if (picked != null && picked != _saat) {
              setState(() => _saat = picked);
            }
          },
        ),
      ],
    );
  }

  Widget _accidentDetailsForm() {
    // Kaza detayları formu
    // Bu alan, modeldeki KazaOlayTuru ve EtkilenenBolge enum'ları için dropdown menüler,
    // ve diğer ilgili detay alanları içerecek şekilde genişletilebilir.
    return Container(); // Bu metod, örnek amaçlı boş bırakılmıştır.
  }

  Widget _postAccidentActionsForm() {
    // Kaza sonrası işlemler formu
    // Bu alan, kaza sonrasında yapılan işlemlerle ilgili detayları toplayacak checkbox'lar,
    // ve diğer ilgili form elemanlarını içerebilir.
    return Container(); // Bu metod, örnek amaçlı boş bırakılmıştır.
  }
}
