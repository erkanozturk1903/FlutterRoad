// ignore_for_file: use_key_in_widget_constructors, unnecessary_null_comparison, prefer_if_null_operators, unused_field, cast_from_null_always_fails

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:midsatech_mobile/pages/main/work/corrective_actions/models/corrective_model.dart';

class CorrectiviteFormPage extends StatefulWidget {
  @override
  _CorrectiviteFormPageState createState() => _CorrectiviteFormPageState();
}

class _CorrectiviteFormPageState extends State<CorrectiviteFormPage> {
  final _formKey = GlobalKey<FormBuilderState>();
  int _currentStep = 0;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

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

  Future<void> _submitForm(
      Map<String, dynamic> formData, List<XFile>? imageFileList) async {
    // Debug: Form verilerini konsola yazdır
    print("Form Data: $formData");
    final CorrectiveAction correctiveAction =
        CorrectiveAction.fromForm(formData, imageFileList);

    // Debug: Dönüştürülen IsKazasiReport nesnesinin haritasını konsola yazdır
    print("IsKazasiReport toMap: ${correctiveAction.toMap()}");
    try {
      await FirebaseFirestore.instance
          .collection('midsatech')
          .doc('customers')
          .collection('administrator')
          .doc('dof')
          .collection('dof_list')
          .add(correctiveAction.toMap());
      print('Corrective action saved successfully');
    } catch (e) {
      print('Error saving corrective action: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF021734),
        foregroundColor: Colors.white,
        title: Text(
          'cpa_form'.tr,
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
                  const SizedBox(width: 10),
                  _currentStep == 5
                      ? const SizedBox()
                      : TextButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                              Colors.deepOrange,
                            ),
                          ),
                          onPressed: () {
                            _currentStep < 5
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
                ],
              );
            },
            steps: <Step>[
              Step(
                title: Text('general_information'.tr),
                content: Column(
                  children: <Widget>[
                    FormBuilderTextField(
                      name: 'businessName',
                      decoration:
                          InputDecoration(labelText: 'business_name'.tr),
                    ),
                    FormBuilderTextField(
                      name: 'cpaNumber',
                      decoration: InputDecoration(labelText: 'cpa_number'.tr),
                    ),
                    FormBuilderDateTimePicker(
                      name: 'date',
                      inputType: InputType.date,
                      format: DateFormat('yyyy-MM-dd'),
                      decoration: InputDecoration(labelText: 'date'.tr),
                    ),
                    FormBuilderCheckboxGroup(
                      name: 'demandWhy',
                      options: [
                        FormBuilderFieldOption(value: 'field_inspection'.tr),
                        FormBuilderFieldOption(value: 'employee_suggestion'.tr),
                        FormBuilderFieldOption(value: 'survey'.tr),
                        FormBuilderFieldOption(value: 'work_accident'.tr),
                        FormBuilderFieldOption(value: 'internal_audit'.tr),
                        FormBuilderFieldOption(value: 'external_audit'.tr),
                      ],
                    ),
                  ],
                ),
                isActive: _currentStep >= 0,
                state:
                    _currentStep >= 0 ? StepState.complete : StepState.disabled,
              ),
              Step(
                title: Text('requesting_the_activity'.tr),
                content: Column(
                  children: <Widget>[
                    FormBuilderTextField(
                      name: 'nameSurname',
                      decoration:
                          InputDecoration(labelText: 'name_and_surname'.tr),
                    ),
                    FormBuilderTextField(
                      name: 'mission',
                      decoration: InputDecoration(labelText: 'mission'.tr),
                    ),
                    FormBuilderTextField(
                      name: 'unitOfWork',
                      decoration: InputDecoration(labelText: 'unit_of_work'.tr),
                    ),
                  ],
                ),
                isActive: _currentStep >= 1,
                state:
                    _currentStep >= 1 ? StepState.complete : StepState.disabled,
              ),
              Step(
                title: Text('non_conformity_information'.tr),
                content: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      FormBuilderTextField(
                        maxLines: 2,
                        name: 'nonconformityDefinition',
                        decoration: InputDecoration(
                            labelText: 'definition_of_nonconformity'.tr),
                      ),
                      FormBuilderTextField(
                        maxLines: 2,
                        name: 'possibleRisks',
                        decoration:
                            InputDecoration(labelText: 'possible_risks'.tr),
                      ),
                      FormBuilderTextField(
                        maxLines: 2,
                        name: 'rootCause',
                        decoration: InputDecoration(labelText: 'root_cause'.tr),
                      ),
                      FormBuilderTextField(
                        maxLines: 2,
                        name: 'adviceSuggestions',
                        decoration: InputDecoration(
                            labelText: 'advice_and_suggestions'.tr),
                      ),
                    ],
                  ),
                ),
                isActive: _currentStep >= 2,
                state:
                    _currentStep >= 2 ? StepState.complete : StepState.disabled,
              ),
              Step(
                title: Text('corrective_preventive_activities'.tr),
                content: Column(
                  children: <Widget>[
                    FormBuilderTextField(
                      maxLines: 2,
                      name: 'activitiesPerformed',
                      decoration:
                          InputDecoration(labelText: 'activities_performed'.tr),
                    ),
                    FormBuilderCheckboxGroup(
                      name: 'cpaResult',
                      options: [
                        FormBuilderFieldOption(value: 'activity_continues'.tr),
                        FormBuilderFieldOption(value: 'activity_completed'.tr),
                      ],
                    ),
                    FormBuilderDateTimePicker(
                      name: 'dateResult',
                      inputType: InputType.date,
                      format: DateFormat('yyyy-MM-dd'),
                      decoration: InputDecoration(labelText: 'date_result'.tr),
                    ),
                  ],
                ),
                isActive: _currentStep >= 3,
                state:
                    _currentStep >= 3 ? StepState.complete : StepState.disabled,
              ),
              Step(
                title: Text('correctivite_photos'.tr),
                content: Row(
                  children: [
                    Container(
                      color: Colors.grey[200],
                      height: 150,
                      width: 150,
                      child: imageFileList != null
                          ? prewiewImages()
                          : Center(
                              child: Text('no_image_selected'.tr),
                            ),
                    )
                  ],
                ),
                isActive: _currentStep >= 4,
                state:
                    _currentStep >= 4 ? StepState.complete : StepState.disabled,
              ),
              Step(
                title: Text('result'.tr),
                content: Column(
                  children: <Widget>[
                    FormBuilderTextField(
                      name: 'approvedName',
                      decoration:
                          InputDecoration(labelText: 'name_and_surname'.tr),
                    ),
                  ],
                ),
                isActive: _currentStep >= 5,
                state:
                    _currentStep >= 5 ? StepState.complete : StepState.disabled,
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
            onPressed: () async {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                final data = _formKey.currentState!.value;
                await _submitForm(data, imageFileList);
              }
              Navigator.pop(context);
            },
            child: const Icon(Icons.save, color: Colors.white),
          )
        ],
      ),
    );
  }
}
