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

  late IsKazasi _isKazasi;
  late IsyeriBilgileri _isyeriBilgileri;
  late KazaOlayBilgileri _kazaOlayBilgileri;
  late KazazedeBilgileri _kazazedeBilgileri;
  late KazaOlayArastirmasi _kazaOlayArastirmasi;
  late Sonuclar _sonuclar;
  late ArastirmaEkibi _arastirmaEkibi;

  @override
  void initState() {
    super.initState();
    _isyeriBilgileri = IsyeriBilgileri(
      isverenTuru: '',
      isYeriAdi: '',
      digerIsYeriAdi: '',
    );
    _kazaOlayBilgileri = KazaOlayBilgileri(
      kazaNo: '',
      tarih: DateTime.now(),
      kazaYeri: '',
      saat: '',
      faaliyet: '',
      vardiya: '',
    );
    _kazazedeBilgileri = KazazedeBilgileri(
      adiSoyadi: '',
      sicilNo: '',
      birimi: '',
      tcKimlikNo: '',
      iseGirisTarihi: DateTime.now(),
      dogumTarihi: DateTime.now(),
    );
    _kazaOlayArastirmasi = KazaOlayArastirmasi(
      kazaOlayTarifi: '',
      kazaOlayTuru: [],
      etkilenenBolge: [],
      kazaninNedeni: {},
    );
    _sonuclar = Sonuclar(
      kazaOlaySonucu: [],
      raporGunSayisi: '',
      hastaneAdi: '',
      kazaSonrasiYapilanIslemler: [],
    );
    _arastirmaEkibi = ArastirmaEkibi(
      adiSoyadi: '',
      gorevi: '',
      tarih: DateTime.now(),
      imza: '',
    );
    _isKazasi = IsKazasi(
      isyeriBilgileri: _isyeriBilgileri,
      kazaOlayBilgileri: _kazaOlayBilgileri,
      kazazedeBilgileri: _kazazedeBilgileri,
      kazaOlayArastirmasi: _kazaOlayArastirmasi,
      sonuclar: _sonuclar,
      arastirmaEkibi: _arastirmaEkibi,
    );
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      _formKey.currentState!.reset();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF021734),
        foregroundColor: Colors.white,
        title: const Text(
          'İş Kazası Formu',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Stepper(
            type: StepperType.vertical,
            connectorColor:
                MaterialStateColor.resolveWith((states) => Colors.deepOrange),
            currentStep: _currentStep,
            onStepTapped: (value) => setState(() => _currentStep = value),
            controlsBuilder: (context, details) {
              return Row(
                children: [
                  _currentStep == 5
                      ? const SizedBox()
                      : TextButton(
                          onPressed: () {
                            _currentStep < 5
                                ? setState(() => _currentStep += 1)
                                : null;
                          },
                          child: const Text(
                            'İleri',
                            style: TextStyle(
                              color: Color(0xFF021734),
                            ),
                          ),
                        ),
                  _currentStep == 0
                      ? const SizedBox()
                      : TextButton(
                          onPressed: () {
                            _currentStep > 0
                                ? setState(() => _currentStep -= 1)
                                : null;
                          },
                          child: const Text(
                            'Geri',
                            style: TextStyle(
                              color: Color(0xFF021734),
                            ),
                          ),
                        ),
                ],
              );
            },
            steps: _getSteps(),
          ),
        ),
      ),
      floatingActionButton: _currentStep == 5
          ? FloatingActionButton(
              onPressed: _submitForm,
              child: Icon(Icons.save),
            )
          : null,
    );
  }

  List<Step> _getSteps() {
    return [
      Step(
        title: Text('İş Yeri Bilgileri'),
        content: _generalInformationForm(),
        isActive: _currentStep >= 0,
        state: _currentStep > 0 ? StepState.complete : StepState.disabled,
      ),
      Step(
        title: Text('Kaza Olayı Bilgileri'),
        content: _accidentDetailsForm(),
        isActive: _currentStep >= 1,
        state: _currentStep > 1 ? StepState.complete : StepState.indexed,
      ),
      Step(
        title: Text('Kazazedeye İlişkin Bilgiler'),
        content: _personnelInformationForm(),
        isActive: _currentStep >= 2,
        state: _currentStep > 2 ? StepState.complete : StepState.indexed,
      ),
      Step(
        title: Text('Kaza Sonrası İşlemler'),
        content: _postAccidentActionsForm(),
        isActive: _currentStep >= 3,
        state: _currentStep > 3 ? StepState.complete : StepState.indexed,
      ),
      Step(
        title: Text('Kaza Sonrası Yapılan İşlemler'),
        content: _accidentActionsAftermathForm(),
        isActive: _currentStep >= 4,
        state: _currentStep > 4 ? StepState.complete : StepState.indexed,
      ),
      Step(
        title: Text('Sonuçlar'),
        content: _resultsForm(),
        isActive: _currentStep >= 5,
        state: _currentStep > 5 ? StepState.complete : StepState.disabled,
      ),
    ];
  }

  Widget _generalInformationForm() {
    return Column(
      children: [
        TextFormField(
          decoration: InputDecoration(labelText: 'İş Yeri Adı'),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Lütfen bu alanı doldurun';
            }
            return null;
          },
          onSaved: (value) => _isyeriBilgileri.isYeriAdi = value ?? '',
        ),
        TextFormField(
          decoration: InputDecoration(labelText: 'Kaza Yeri'),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Lütfen bu alanı doldurun';
            }
            return null;
          },
          onSaved: (value) => _kazaOlayBilgileri.kazaYeri = value ?? '',
        ),
        // Tarih seçici
        ListTile(
          title: Text(
              'Tarih: ${_kazaOlayBilgileri.tarih != null ? DateFormat('yyyy-MM-dd').format(_kazaOlayBilgileri.tarih!) : 'Seçilmedi'}'),
          onTap: () async {
            DateTime? picked = await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(2000),
              lastDate: DateTime(2025),
            );
            if (picked != null && picked != _kazaOlayBilgileri.tarih) {
              setState(() => _kazaOlayBilgileri.tarih = picked);
            }
          },
        ),
        // Saat seçici
        ListTile(
          title: Text(
              'Saat: ${_kazaOlayBilgileri.saat != null ? _kazaOlayBilgileri.saat : 'Seçilmedi'}'),
          onTap: () async {
            TimeOfDay? picked = await showTimePicker(
              context: context,
              initialTime: TimeOfDay.now(),
            );
            if (picked != null && picked != _kazaOlayBilgileri.saat) {
              setState(() => _kazaOlayBilgileri.saat = picked.format(context));
            }
          },
        ),
        TextFormField(
          decoration: InputDecoration(labelText: 'Faaliyet'),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Lütfen bu alanı doldurun';
            }
            return null;
          },
          onSaved: (value) => _kazaOlayBilgileri.faaliyet = value ?? '',
        ),
        TextFormField(
          decoration: InputDecoration(labelText: 'Vardiya'),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Lütfen bu alanı doldurun';
            }
            return null;
          },
          onSaved: (value) => _kazaOlayBilgileri.vardiya = value ?? '',
        ),
      ],
    );
  }

  Widget _accidentDetailsForm() {
    return Column(
      children: [
        TextFormField(
          decoration: InputDecoration(labelText: 'Kaza No'),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Lütfen bu alanı doldurun';
            }
            return null;
          },
          onSaved: (value) => _kazaOlayBilgileri.kazaNo = value ?? '',
        ),
        // Kaza olayı tarifi
        TextFormField(
          decoration: InputDecoration(labelText: 'Kaza Olayı Tarifi'),
          maxLines: null,
          keyboardType: TextInputType.multiline,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Lütfen bu alanı doldurun';
            }
            return null;
          },
          onSaved: (value) => _kazaOlayArastirmasi.kazaOlayTarifi = value ?? '',
        ),
        // Kaza olayı türü
        TextFormField(
          decoration: InputDecoration(labelText: 'Kaza Olayı Türü'),
          maxLines: null,
          keyboardType: TextInputType.multiline,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Lütfen bu alanı doldurun';
            }
            return null;
          },
          onSaved: (value) => _kazaOlayArastirmasi.kazaOlayTuru = [value ?? ''],
        ),
        // Etkilenen bölge
        TextFormField(
          decoration: InputDecoration(labelText: 'Etkilenen Bölge'),
          maxLines: null,
          keyboardType: TextInputType.multiline,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Lütfen bu alanı doldurun';
            }
            return null;
          },
          onSaved: (value) =>
              _kazaOlayArastirmasi.etkilenenBolge = [value ?? ''],
        ),
      ],
    );
  }

  Widget _personnelInformationForm() {
    return Column(
      children: [
        TextFormField(
          decoration: InputDecoration(labelText: 'Adı Soyadı'),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Lütfen bu alanı doldurun';
            }
            return null;
          },
          onSaved: (value) => _kazazedeBilgileri.adiSoyadi = value ?? '',
        ),
        TextFormField(
          decoration: InputDecoration(labelText: 'Sicil No'),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Lütfen bu alanı doldurun';
            }
            return null;
          },
          onSaved: (value) => _kazazedeBilgileri.sicilNo = value ?? '',
        ),
        TextFormField(
          decoration: InputDecoration(labelText: 'Birimi'),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Lütfen bu alanı doldurun';
            }
            return null;
          },
          onSaved: (value) => _kazazedeBilgileri.birimi = value ?? '',
        ),
        TextFormField(
          decoration: InputDecoration(labelText: 'TC Kimlik No'),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Lütfen bu alanı doldurun';
            }
            return null;
          },
          onSaved: (value) => _kazazedeBilgileri.tcKimlikNo = value ?? '',
        ),
        // İşe giriş tarihi seçici
        ListTile(
          title: Text(
              'İşe Giriş Tarihi: ${_kazazedeBilgileri.iseGirisTarihi != null ? DateFormat('yyyy-MM-dd').format(_kazazedeBilgileri.iseGirisTarihi!) : 'Seçilmedi'}'),
          onTap: () async {
            DateTime? picked = await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(1900),
              lastDate: DateTime.now(),
            );
            if (picked != null && picked != _kazazedeBilgileri.iseGirisTarihi) {
              setState(() => _kazazedeBilgileri.iseGirisTarihi = picked);
            }
          },
        ),
        // Doğum tarihi seçici
        ListTile(
          title: Text(
              'Doğum Tarihi: ${_kazazedeBilgileri.dogumTarihi != null ? DateFormat('yyyy-MM-dd').format(_kazazedeBilgileri.dogumTarihi!) : 'Seçilmedi'}'),
          onTap: () async {
            DateTime? picked = await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(1900),
              lastDate: DateTime.now(),
            );
            if (picked != null && picked != _kazazedeBilgileri.dogumTarihi) {
              setState(() => _kazazedeBilgileri.dogumTarihi = picked);
            }
          },
        ),
      ],
    );
  }

  Widget _postAccidentActionsForm() {
    return Column(
      children: [
        TextFormField(
          decoration: InputDecoration(labelText: 'Kaza Sonrası İşlemler'),
          maxLines: null,
          keyboardType: TextInputType.multiline,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Lütfen bu alanı doldurun';
            }
            return null;
          },
          onSaved: (value) =>
              _sonuclar.kazaSonrasiYapilanIslemler = [value ?? ''],
        ),
      ],
    );
  }

  Widget _accidentActionsAftermathForm() {
    return Column(
      children: [
        TextFormField(
          decoration:
              InputDecoration(labelText: 'Kaza Sonrası Yapılan İşlemler'),
          maxLines: null,
          keyboardType: TextInputType.multiline,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Lütfen bu alanı doldurun';
            }
            return null;
          },
          onSaved: (value) =>
              _sonuclar.kazaSonrasiYapilanIslemler = [value ?? ''],
        ),
      ],
    );
  }

  Widget _resultsForm() {
    return Column(
      children: [
        TextFormField(
          decoration: InputDecoration(labelText: 'Kaza Olay Sonucu'),
          maxLines: null,
          keyboardType: TextInputType.multiline,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Lütfen bu alanı doldurun';
            }
            return null;
          },
          onSaved: (value) => _sonuclar.kazaOlaySonucu = [value ?? ''],
        ),
        TextFormField(
          decoration: InputDecoration(labelText: 'Rapor Gün Sayısı'),
          keyboardType: TextInputType.number,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Lütfen bu alanı doldurun';
            }
            return null;
          },
          onSaved: (value) => _sonuclar.raporGunSayisi = value ?? '',
        ),
        TextFormField(
          decoration: InputDecoration(labelText: 'Hastane Adı'),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Lütfen bu alanı doldurun';
            }
            return null;
          },
          onSaved: (value) => _sonuclar.hastaneAdi = value ?? '',
        ),
      ],
    );
  }
}
