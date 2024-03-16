// ignore_for_file: use_key_in_widget_constructors, unnecessary_null_comparison, prefer_if_null_operators, unused_field, cast_from_null_always_fails

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:midsatech_mobile/pages/main/work/corrective_actions/correctivite_form/models/corrective_model.dart';

class CorrectiviteFormPage extends StatefulWidget {
  @override
  _CorrectiviteFormPageState createState() => _CorrectiviteFormPageState();
}

class _CorrectiviteFormPageState extends State<CorrectiviteFormPage> {
  final _formKey = GlobalKey<FormState>();
  int _currentStep = 0;

  final ImagePicker _picker = ImagePicker();
  List<XFile>? imageFileList = [];
  dynamic _pickImageError;

  CorrectiviteFormData formData = CorrectiviteFormData(
    businessName: '',
    cpaNumber: '',
    date: null,
    demandWhy: [],
    nameSurname: '',
    mission: '',
    unitOfWork: '',
    definitionOfNonconformity: '',
    possibleRisks: '',
    rootCause: '',
    adviceAndSuggestions: '',
    imagePaths: [],
    activitiesPerformed: '',
    cpaResult: [],
    dateResult: null,
    approvedName: '',
  );

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
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

/*     // Verileri formData nesnesine atama
    CorrectiviteFormData formData = CorrectiviteFormData(
      
      businessName: _formKey.currentState.['field1']!.value.toString(),
      cpaNumber: _formKey.currentState!.fields['field2']!.value.toString(),
      date: _formKey.currentState!.fields['date']!.value as DateTime?,
      demandWhy: (_formKey.currentState!.fields['demandwhy']!.value as List).map((value) => value.toString()).toList(),
      nameSurname: _formKey.currentState!.fields['adi']!.value.toString(),
      mission: _formKey.currentState!.fields['mission']!.value.toString(),
      unitOfWork: _formKey.currentState!.fields['unit']!.value.toString(),
      definitionOfNonconformity: _formKey.currentState!.fields['defination']!.value.toString(),
      possibleRisks: _formKey.currentState!.fields['posible_risks']!.value.toString(),
      rootCause: _formKey.currentState!.fields['root_cause']!.value.toString(),
      adviceAndSuggestions: _formKey.currentState!.fields['advice_suggestions']!.value.toString(),
      imagePaths: imageFileList!.map((image) => image.path).toList(),
      activitiesPerformed: _formKey.currentState!.fields['activities_performed']!.value.toString(),
      cpaResult: (_formKey.currentState!.fields['cpa_result']!.value as List).map((value) => value.toString()).toList(),
      dateResult: _formKey.currentState!.fields['date_result']!.value as DateTime?,
      approvedName: _formKey.currentState!.fields['approved_name']!.value.toString(),
    );
 */
      // Verileri formData nesnesi üzerinden işleme devam etme
      print(formData.toJson());

      // Formu sıfırla
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
          'CPA Form',
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
                          onPressed: () {
                            _currentStep < 4
                                ? setState(() => _currentStep += 1)
                                : null;
                          },
                          child: const Text(
                            'Next',
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
                            'Back',
                            style: TextStyle(
                              color: Color(0xFF021734),
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
                      name: 'field1',
                      decoration: InputDecoration(labelText: 'Business Name'),
                    ),
                    FormBuilderTextField(
                      name: 'field2',
                      decoration: InputDecoration(labelText: 'CPA Number'),
                    ),
                    FormBuilderDateTimePicker(
                      name: 'date',
                      inputType: InputType.date,
                      format: DateFormat('yyyy-MM-dd'),
                      decoration: InputDecoration(labelText: 'Date'),
                    ),
                    FormBuilderCheckboxGroup(
                      name: 'demandwhy',
                      options: const [
                        FormBuilderFieldOption(value: 'Field Inspection'),
                        FormBuilderFieldOption(value: 'Employee Suggestion'),
                        FormBuilderFieldOption(value: 'Survey'),
                        FormBuilderFieldOption(value: 'Work Accident'),
                        FormBuilderFieldOption(value: 'Internal Audit'),
                        FormBuilderFieldOption(value: 'External Audit'),
                      ],
                    ),
                  ],
                ),
                isActive: _currentStep >= 0,
                state:
                    _currentStep >= 0 ? StepState.complete : StepState.disabled,
              ),
              Step(
                title: Text('Requesting The Activity'),
                content: Column(
                  children: <Widget>[
                    FormBuilderTextField(
                      name: 'adi',
                      decoration: InputDecoration(labelText: 'Name -Surname'),
                    ),
                    FormBuilderTextField(
                      name: 'mission',
                      decoration: InputDecoration(labelText: 'Mission'),
                    ),
                    FormBuilderTextField(
                      name: 'unit',
                      decoration: InputDecoration(labelText: 'Unit Of Work'),
                    ),
                  ],
                ),
                isActive: _currentStep >= 1,
                state:
                    _currentStep >= 1 ? StepState.complete : StepState.disabled,
              ),
              Step(
                title: Text('Non-Conformity Information'),
                content: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      FormBuilderTextField(
                        maxLines: 2,
                        name: 'defination',
                        decoration: InputDecoration(
                            labelText: 'Definition of Nonconformity'),
                      ),
                      FormBuilderTextField(
                        maxLines: 2,
                        name: 'posible_risks',
                        decoration:
                            InputDecoration(labelText: 'Possible Risks'),
                      ),
                      FormBuilderTextField(
                        maxLines: 2,
                        name: 'root_cause',
                        decoration: InputDecoration(labelText: 'Root Cause'),
                      ),
                      FormBuilderTextField(
                        maxLines: 2,
                        name: 'advice_suggestions',
                        decoration: InputDecoration(
                            labelText: 'Advice and Suggestions'),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Container(
                            color: Colors.grey[200],
                            height: 150,
                            width: 150,
                            child: imageFileList != null
                                ? prewiewImages()
                                : const Center(
                                    child: Text('No Image Selected'),
                                  ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                isActive: _currentStep >= 2,
                state:
                    _currentStep >= 2 ? StepState.complete : StepState.disabled,
              ),
              Step(
                title: Text('Corrective Preventive Activities'),
                content: Column(
                  children: <Widget>[
                    FormBuilderTextField(
                      maxLines: 2,
                      name: 'activities_performed',
                      decoration:
                          InputDecoration(labelText: 'Activities Performed'),
                    ),
                    FormBuilderCheckboxGroup(
                      name: 'cpa_result',
                      options: const [
                        FormBuilderFieldOption(value: 'Activity Continues'),
                        FormBuilderFieldOption(value: 'Activity Completed'),
                      ],
                    ),
                    FormBuilderDateTimePicker(
                      name: 'date_result',
                      inputType: InputType.date,
                      format: DateFormat('yyyy-MM-dd'),
                      decoration: InputDecoration(labelText: 'Date Result'),
                    ),
                  ],
                ),
                isActive: _currentStep >= 3,
                state:
                    _currentStep >= 3 ? StepState.complete : StepState.disabled,
              ),
              Step(
                title: Text('Result'),
                content: Column(
                  children: <Widget>[
                    FormBuilderTextField(
                      name: 'approved_name',
                      decoration: InputDecoration(labelText: 'Name Surname'),
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
