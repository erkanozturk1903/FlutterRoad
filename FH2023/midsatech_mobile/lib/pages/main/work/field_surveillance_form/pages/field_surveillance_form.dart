// ignore_for_file: use_key_in_widget_constructors, unnecessary_null_comparison, prefer_if_null_operators, unused_field, cast_from_null_always_fails

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class FieldSurveillanceFormPage extends StatefulWidget {
  @override
  _FieldSurveillanceFormPageState createState() =>
      _FieldSurveillanceFormPageState();
}

class _FieldSurveillanceFormPageState extends State<FieldSurveillanceFormPage> {
  final _formKey = GlobalKey<FormState>();
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

  void _submitForm() {
    print('Kaydedildi');
    Navigator.pop(context);
  }

  void _hesaplaVeOnlemGoster() {
    if (_selectedOlasilik != null && _selectedSiddet != null) {
      setState(() {
        _sonuc = _selectedOlasilik! * _selectedSiddet!;
      });
      String onlemlerMesaji;
      if (_sonuc! >= 15 && _sonuc! < 25) {
        _sonucRengi = Colors.red;
        onlemlerMesaji = """
II. Priority Hazards:
Subjects that received 25 points as a result of the evaluation:
• Work is stopped immediately.
• The danger is brought under control.
• Documented procedures/instructions are created for control.
  • A monitoring and measurement plan is made and records are kept.
   • Corrective and preventive actions for improvement are determined,
    is documented, implemented and monitored. •
    1. priority hazards are accepted as a result of controls
    It is aimed to reduce it to acceptable limits.
     • Where possible, quantify improvements.
     are tracked and recorded.
     • Necessary training is given to the personnel.
      • All implementations on these issues are reviewed periodically.
      It is audited and reported to management.
"""; // Uzun açıklama yer alacak
      } else if (_sonuc! >= 8 && _sonuc! < 15) {
        _sonucRengi = Colors.yellow;
        onlemlerMesaji = """
III.Priority Hazards:
  As a result of the evaluation, over 8 (inclusive) points and below 15 points
   Topics that get points:
  The measures are described in the planned applications section and the implementation
  checks are made.
   Necessary training is given to the staff.
    3. Priority hazards are acceptable as a result of controls
     It is aimed to reduce it to the limits.
""";
      } else if (_sonuc! <= 6) {
        _sonucRengi = Colors.green;
        onlemlerMesaji = """
IV. Priority Hazards:
  Subjects that received 6 or less points as a result of the evaluation:
  It is examined to ensure that it does not pose a significant danger in the future.
  and, if necessary, measures are described in the planned applications section,
   Application checks are carried out and necessary training is given to the personnel.
""";
      } else if (_sonuc == 25) {
        _sonucRengi = Colors.red;
        onlemlerMesaji = """
I. Priority Hazards:
  Subjects that received 25 points as a result of the evaluation:
   • Work is stopped immediately.
   • The danger is brought under control.
    • Documented procedures/instructions are created for control.
     • A monitoring and measurement plan is made and records are kept.
      • Corrective and preventive actions for improvement are determined,
       is documented, implemented and monitored.
       • 1st priority hazards can be accepted as a result of controls.
        It is aimed to reduce it to the limits.
         • Where possible, quantify improvements.
         are tracked and recorded.
          • Necessary training is given to the personnel.
           • All practices on these issues are audited periodically and reported to the management.
""";
      } else {
        onlemlerMesaji = 'Undetermined Risk';
      }
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Precautions to take'),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text(onlemlerMesaji),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: Text('Ok'),
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
        title: const Text(
          'Near Miss Form',
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
                          child: const Text(
                            'Next',
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
                          child: const Text(
                            'Back',
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
                title: Text('General Information'),
                content: Column(
                  children: <Widget>[
                    FormBuilderTextField(
                      name: 'detecting',
                      decoration: InputDecoration(labelText: 'Detecting'),
                    ),
                    FormBuilderTextField(
                      name: 'prepared_by',
                      decoration:
                          InputDecoration(labelText: 'Prepared the Report By'),
                    ),
                    FormBuilderTextField(
                      name: 'report_number',
                      decoration: InputDecoration(labelText: 'Report Number'),
                    ),
                    FormBuilderDateTimePicker(
                      name: 'date',
                      inputType: InputType.date,
                      format: DateFormat('yyyy-MM-dd'),
                      decoration: InputDecoration(labelText: 'Date'),
                    ),
                  ],
                ),
                isActive: _currentStep >= 0,
                state:
                    _currentStep >= 0 ? StepState.complete : StepState.disabled,
              ),
              Step(
                title: Text('Type/Definition Of Nonconformity'),
                content: Column(
                  children: <Widget>[
                    FormBuilderTextField(
                      maxLines: 3,
                      maxLength: 500,
                      name: 'definition_nonconformity',
                      decoration: InputDecoration(
                          labelText: 'Definition of Of Nonconformity'),
                    ),
                    FormBuilderTextField(
                      maxLines: 3,
                      maxLength: 500,
                      name: 'reason_nonconformity',
                      decoration: InputDecoration(
                          labelText: 'Reasoon For Non-Conformity'),
                    ),
                    FormBuilderTextField(
                      name: 'address_unit',
                      decoration: InputDecoration(labelText: 'Address of Unit'),
                    ),
                    FormBuilderTextField(
                      name: 'responsible_unit',
                      decoration:
                          InputDecoration(labelText: 'Responsible Unit'),
                    ),
                  ],
                ),
                isActive: _currentStep >= 1,
                state:
                    _currentStep >= 1 ? StepState.complete : StepState.disabled,
              ),
              Step(
                title: Text('Nonconformity Photo'),
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
                                : const Center(
                                    child: Text('No Image Selected'),
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
                title: Text('What is the incident?'),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    DropdownButton<int>(
                      hint: Text('Select Possibility'),
                      value: _selectedOlasilik,
                      items: const [
                        DropdownMenuItem(value: 5, child: Text('5 Very High')),
                        DropdownMenuItem(value: 4, child: Text('4 High')),
                        DropdownMenuItem(value: 3, child: Text('3 Middle')),
                        DropdownMenuItem(value: 2, child: Text('2 Low')),
                        DropdownMenuItem(value: 1, child: Text('1 Very Low')),
                      ],
                      onChanged: (value) {
                        setState(() {
                          _selectedOlasilik = value;
                          _hesaplaVeOnlemGoster();
                        });
                      },
                    ),
                    DropdownButton<int>(
                      hint: Text('Violence Seçiniz'),
                      value: _selectedSiddet,
                      items: const [
                        DropdownMenuItem(value: 5, child: Text('5 So serious')),
                        DropdownMenuItem(value: 4, child: Text('4 Serious')),
                        DropdownMenuItem(value: 3, child: Text('3 Middle')),
                        DropdownMenuItem(value: 2, child: Text('2 Light')),
                        DropdownMenuItem(value: 1, child: Text('1 Very Light')),
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
                              'Risk assessment: $_sonuc',
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
                title: Text('Regulatory and Preventive Activity Suggestions'),
                content: Column(
                  children: <Widget>[
                    FormBuilderTextField(
                      maxLength: 1000,
                      maxLines: 4,
                      name: 'opinion_unit_responsible',
                      decoration: InputDecoration(
                          labelText: 'Opinion of the Unit Responsible'),
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
