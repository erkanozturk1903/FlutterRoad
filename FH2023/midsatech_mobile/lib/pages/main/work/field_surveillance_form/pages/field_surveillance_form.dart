// ignore_for_file: use_key_in_widget_constructors, unnecessary_null_comparison, prefer_if_null_operators, unused_field, cast_from_null_always_fails

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:midsatech_mobile/pages/main/work/field_surveillance_form/models/field_surveiallance.dart';

class FieldSurveillanceFormPage extends StatefulWidget {
  @override
  _FieldSurveillanceFormPageState createState() =>
      _FieldSurveillanceFormPageState();
}

class _FieldSurveillanceFormPageState extends State<FieldSurveillanceFormPage> {
  final _formKey = GlobalKey<FormBuilderState>();
  int _currentStep = 0;
  int? _selectedOlasilik;
  int? _selectedSiddet;
  int? _sonuc;
  Color? _sonucRengi;

  final ImagePicker _picker = ImagePicker();
  List<XFile>? imageFileList = [];
  dynamic _pickImageError;

  void pickImages() async {
    try {
      final pickedImages = await _picker.pickMultiImage(
        maxHeight: 100,
        maxWidth: 100,
        imageQuality: 95,
      );
      setState(() {
        imageFileList = pickedImages;
      });
    } catch (e) {
      setState(() {
        _pickImageError = e;
      });
      print(_pickImageError);
    }
  }

  Widget prewiewImages() {
    return InkWell(
      onTap: () {
        setState(() {
          imageFileList = [];
        });
      },
      child: ListView.builder(
        itemCount: imageFileList!.length,
        itemBuilder: (context, index) {
          return Image.file(File(imageFileList![index].path));
        },
      ),
    );
  }

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> addFormToFirestore(FieldSurveillanceFormModel formModel) async {
    try {
      await _firestore
          .collection('field_surveillance_forms')
          .add(formModel.toMap());
    } catch (e) {
      print('Error adding form to Firestore: $e');
    }
  }

  void _submitForm() {
    _formKey.currentState?.save();
    if (_formKey.currentState != null) {
      final formData = _formKey.currentState!.value;
      final formModel = FieldSurveillanceFormModel(
        detecting: formData['detecting'],
        preparedBy: formData['prepared_by'],
        reportNumber: formData['report_number'],
        date: formData['date'],
        definitionOfNonconformity: formData['definition_nonconformity'],
        reasonForNonconformity: formData['reason_nonconformity'],
        addressOfUnit: formData['address_unit'],
        responsibleUnit: formData['responsible_unit'],
        imageUrls: imageFileList!.map((file) => file.path).toList(),
        selectedPossibility: _selectedOlasilik!,
        selectedViolence: _selectedSiddet!,
        riskAssessment: _sonuc!,
        opinionOfTheUnitResponsible: formData['opinion_unit_responsible'],
      );

      addFormToFirestore(formModel);
      print('Kaydedildi');
      Navigator.pop(context);
    }
  }

  void _hesaplaVeOnlemGoster() {
    if (_selectedOlasilik != null && _selectedSiddet != null) {
      setState(() {
        _sonuc = _selectedOlasilik! * _selectedSiddet!;
      });
      String onlemlerMesaji;
      if (_sonuc! >= 15 && _sonuc! < 25) {
        _sonucRengi = Colors.red;
        onlemlerMesaji = "ii_priority_hazards".tr; // Uzun açıklama yer alacak
      } else if (_sonuc! >= 8 && _sonuc! < 15) {
        _sonucRengi = Colors.yellow;
        onlemlerMesaji = "iii_priority_hazards".tr;
      } else if (_sonuc! <= 6) {
        _sonucRengi = Colors.green;
        onlemlerMesaji = "iv_priority_hazards".tr;
      } else if (_sonuc == 25) {
        _sonucRengi = Colors.red;
        onlemlerMesaji = "i_priority_hazards".tr;
      } else {
        onlemlerMesaji = 'undetermined_risk'.tr;
      }
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('precautions_to_take'.tr),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text(onlemlerMesaji),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: Text('ok'.tr),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF021734),
        foregroundColor: Colors.white,
        title: Text(
          'near_miss_form'.tr,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: FormBuilder(
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
                  _currentStep == 4
                      ? const SizedBox()
                      : TextButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                              Colors.deepOrange,
                            ),
                          ),
                          onPressed: () {
                            _currentStep < 4
                                ? setState(() => _currentStep += 1)
                                : null;
                          },
                          child: Text(
                            'next'.tr,
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                  SizedBox(
                    width: 10,
                  ),
                  _currentStep == 0
                      ? const SizedBox()
                      : TextButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                              Colors.deepOrange,
                            ),
                          ),
                          onPressed: () {
                            _currentStep > 0
                                ? setState(() => _currentStep -= 1)
                                : null;
                          },
                          child: Text(
                            'back'.tr,
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                ],
              );
            },
            steps: <Step>[
              Step(
                title: Text('general_information'.tr),
                content: Column(
                  children: <Widget>[
                    FormBuilderTextField(
                      name: 'detecting',
                      decoration: InputDecoration(labelText: 'detecting'.tr),
                    ),
                    FormBuilderTextField(
                      name: 'prepared_by',
                      decoration: InputDecoration(
                          labelText: 'prepared_the_report_by'.tr),
                    ),
                    FormBuilderTextField(
                      name: 'report_number',
                      decoration:
                          InputDecoration(labelText: 'report_number'.tr),
                    ),
                    FormBuilderDateTimePicker(
                      name: 'date',
                      inputType: InputType.date,
                      format: DateFormat('yyyy-MM-dd'),
                      decoration: InputDecoration(labelText: 'date'.tr),
                    ),
                  ],
                ),
                isActive: _currentStep >= 0,
                state:
                    _currentStep >= 0 ? StepState.complete : StepState.disabled,
              ),
              Step(
                title: Text('type_definition_of_nonconformity'.tr),
                content: Column(
                  children: <Widget>[
                    FormBuilderTextField(
                      maxLines: 3,
                      maxLength: 500,
                      name: 'definition_nonconformity',
                      decoration: InputDecoration(
                          labelText: 'definition_of_nonconformity'.tr),
                    ),
                    FormBuilderTextField(
                      maxLines: 3,
                      maxLength: 500,
                      name: 'reason_nonconformity',
                      decoration: InputDecoration(
                          labelText: 'reasoon_for_non_conformity'.tr),
                    ),
                    FormBuilderTextField(
                      name: 'address_unit',
                      decoration: InputDecoration(labelText: 'address_of_unit'.tr),
                    ),
                    FormBuilderTextField(
                      name: 'responsible_unit',
                      decoration:
                          InputDecoration(labelText: 'responsible_unit'.tr),
                    ),
                  ],
                ),
                isActive: _currentStep >= 1,
                state:
                    _currentStep >= 1 ? StepState.complete : StepState.disabled,
              ),
              Step(
                title: Text('nonconformity_photo'.tr),
                content: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: [
                          Container(
                            color: Colors.grey[200],
                            height: 200,
                            width: 200,
                            child: imageFileList != null
                                ? prewiewImages()
                                : Center(
                                    child: Text('no_image_selected'.tr),
                                  ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
                isActive: _currentStep >= 2,
                state:
                    _currentStep >= 2 ? StepState.complete : StepState.disabled,
              ),
              Step(
                title: Text('what_is_the_incident'.tr),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    DropdownButton<int>(
                      hint: Text('select_possibility'.tr),
                      value: _selectedOlasilik,
                      items: [
                        DropdownMenuItem(value: 5, child: Text('five_very_high'.tr)),
                        DropdownMenuItem(value: 4, child: Text('four_high'.tr)),
                        DropdownMenuItem(value: 3, child: Text('three_middle'.tr)),
                        DropdownMenuItem(value: 2, child: Text('two_low'.tr)),
                        DropdownMenuItem(value: 1, child: Text('one_very_low')),
                      ],
                      onChanged: (value) {
                        setState(() {
                          _selectedOlasilik = value;
                          _hesaplaVeOnlemGoster();
                        });
                      },
                    ),
                    DropdownButton<int>(
                      hint: Text('violence_select'.tr),
                      value: _selectedSiddet,
                      items: [
                        DropdownMenuItem(value: 5, child: Text('five_so_serious'.tr)),
                        DropdownMenuItem(value: 4, child: Text('four_serious'.tr)),
                        DropdownMenuItem(value: 3, child: Text('three_middle'.tr)),
                        DropdownMenuItem(value: 2, child: Text('two_light'.tr)),
                        DropdownMenuItem(value: 1, child: Text('one_very_light'.tr)),
                      ],
                      onChanged: (value) {
                        setState(() {
                          _selectedSiddet = value;
                          _hesaplaVeOnlemGoster();
                        });
                      },
                    ),
                    if (_sonuc != null)
                      Container(
                        padding: EdgeInsets.all(8.0),
                        color: _sonucRengi,
                        child: Column(
                          children: [
                            Text(
                              'risk_assessment'.tr + ':' '$_sonuc',
                              style: TextStyle(
                                  fontSize: 24, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 10),
                          ],
                        ),
                      ),
                  ],
                ),
                isActive: _currentStep >= 3,
                state:
                    _currentStep >= 3 ? StepState.complete : StepState.disabled,
              ),
              Step(
                title: Text('regulatory_and_preventive_activity'.tr),
                content: Column(
                  children: <Widget>[
                    FormBuilderTextField(
                      maxLength: 1000,
                      maxLines: 4,
                      name: 'opinion_unit_responsible',
                      decoration: InputDecoration(
                          labelText: 'opinion_of_the_unit_responsible'.tr),
                    ),
                  ],
                ),
                isActive: _currentStep >= 4,
                state:
                    _currentStep >= 4 ? StepState.complete : StepState.disabled,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: FloatingActionButton(
              heroTag: 'addImage',
              backgroundColor: Colors.deepOrange,
              onPressed: pickImages,
              child: const Icon(Icons.add_a_photo, color: Colors.white),
            ),
          ),
          FloatingActionButton(
            heroTag: 'save',
            backgroundColor: Colors.deepOrange,
            onPressed: _submitForm,
            child: const Icon(Icons.save, color: Colors.white),
          )
        ],
      ),
    );
  }
}
