// ignore_for_file: use_key_in_widget_constructors, unnecessary_null_comparison, prefer_if_null_operators, unused_field, cast_from_null_always_fails

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:midsatech_mobile/pages/main/work/work_permit_form/models/work_permit_model.dart';

class WorkPermitFormPage extends StatefulWidget {
  @override
  _WorkPermitFormPageState createState() => _WorkPermitFormPageState();
}

class _WorkPermitFormPageState extends State<WorkPermitFormPage> {
  final _formKey = GlobalKey<FormBuilderState>();
  int _currentStep = 0;

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

  void _submitForm() async {
    if (_formKey.currentState!.saveAndValidate()) {
      final formData = _formKey.currentState!.value;
      final workPermitData = WorkPermitFormData(
        descriptionOfWorkToBeDone:
            formData['description_of_work_to_be_done'] ?? '',
        location: formData['location'] ?? '',
        date: formData['date'] ?? DateTime.now(),
        workingType: List<String>.from(formData['working_type'] ?? []),
        workToDo: formData['work_to_do'] ?? '',
        danger: formData['danger'] ?? '',
        precautionsToTake: formData['precautions_to_take'] ?? '',
        ppeToBeUsed: List<String>.from(formData['ppe_to_be_used'] ?? []),
        nameSurnameOfGrantor: formData['name_surname'] ?? '',
        dateOfGrantor: formData['date_of_grantor'] ?? DateTime.now(),
      );

      try {
        await FirebaseFirestore.instance.collection('work_permits').add(
              workPermitData.toMap(),
            );
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Form submitted successfully!'),
          ),
        );
        Navigator.of(context).pop();
      } catch (e) {
        print('Error submitting form: $e');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('An error occurred, please try again later.'),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF021734),
          foregroundColor: Colors.white,
          title: const Text(
            'Work Permit Form',
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
                  title: Text('description_of_work_to_be_done_one'.tr),
                  content: Column(
                    children: <Widget>[
                      FormBuilderTextField(
                        name: 'description_of_work_to_be_done',
                        decoration: InputDecoration(
                            labelText: 'description_of_work_to_be_done_one'.tr),
                      ),
                      FormBuilderTextField(
                        name: 'location',
                        decoration: InputDecoration(labelText: 'location'.tr),
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
                  state: _currentStep >= 0
                      ? StepState.complete
                      : StepState.disabled,
                ),
                Step(
                  title: Text('working_type_selected'.tr),
                  content: Column(
                    children: <Widget>[
                      FormBuilderCheckboxGroup(
                          enabled: true,
                          checkColor: Colors.white,
                          activeColor: Colors.deepOrange,
                          name: 'working_type',
                          options: [
                            FormBuilderFieldOption(value: 'working_at_height'.tr),
                            FormBuilderFieldOption(
                                value: 'excavation_earthworks'.tr),
                            FormBuilderFieldOption(
                                value: 'electrical_works_working_under_energy'.tr),
                            FormBuilderFieldOption(
                                value: 'flame_cutting_welding'.tr),
                            FormBuilderFieldOption(
                                value:
                                    'hot_works_welding_cutting_grinding'.tr),
                            FormBuilderFieldOption(
                                value:
                                    'machine_maintenance_repair_working_with_moving'.tr),
                            FormBuilderFieldOption(
                                value:
                                    'steam_compressed_air_and_gas_installation'.tr),
                            FormBuilderFieldOption(
                                value: 'working_with_lifting_equipment'.tr),
                            FormBuilderFieldOption(
                                value: 'working_in_confined_spaces'.tr),
                            FormBuilderFieldOption(
                                value:
                                    'disabling_fire_detection_extinguishing_system'.tr),
                            FormBuilderFieldOption(
                                value: 'working_with_chemicals'.tr),
                            FormBuilderFieldOption(
                                value:
                                    'other_one'.tr),
                          ])
                    ],
                  ),
                  isActive: _currentStep >= 1,
                  state: _currentStep >= 1
                      ? StepState.complete
                      : StepState.disabled,
                ),
                Step(
                  title: Text('risk_assessment'),
                  content: SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        FormBuilderTextField(
                          maxLength: 100,
                          maxLines: 1,
                          name: 'work_to_do',
                          decoration: InputDecoration(labelText: 'work_to_do'),
                        ),
                        FormBuilderTextField(
                          maxLength: 1000,
                          maxLines: 4,
                          name: 'danger',
                          decoration: InputDecoration(labelText: 'dangers'.tr),
                        ),
                        FormBuilderTextField(
                          maxLength: 1500,
                          maxLines: 4,
                          name: 'precautions_to_take',
                          decoration:
                              InputDecoration(labelText: 'precautions_to_take'.tr),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                  isActive: _currentStep >= 2,
                  state: _currentStep >= 2
                      ? StepState.complete
                      : StepState.disabled,
                ),
                Step(
                  title: Text('ppe_to_be_used_one'.tr),
                  content: Column(
                    children: <Widget>[
                      FormBuilderCheckboxGroup(
                          enabled: true,
                          checkColor: Colors.white,
                          activeColor: Colors.deepOrange,
                          name: 'ppe_to_be_used',
                          options: [
                            FormBuilderFieldOption(value: 'work_clothes'.tr),
                            FormBuilderFieldOption(value: 'work_shoes'.tr),
                            FormBuilderFieldOption(value: 'work_gloves'.tr),
                            FormBuilderFieldOption(value: 'welder_mask'.tr),
                            FormBuilderFieldOption(value: 'goggles'.tr),
                            FormBuilderFieldOption(value: 'dust_mask'.tr),
                            FormBuilderFieldOption(value: 'safety_belt'.tr),
                            FormBuilderFieldOption(value: 'facial_wall'.tr),
                            FormBuilderFieldOption(
                                value: 'headphone_protector'.tr),
                            FormBuilderFieldOption(value: 'fire_extinguisher'.tr),
                            FormBuilderFieldOption(value: 'hard_hat'.tr),
                            FormBuilderFieldOption(value: 'other'.tr),
                          ])
                    ],
                  ),
                  isActive: _currentStep >= 3,
                  state: _currentStep >= 3
                      ? StepState.complete
                      : StepState.disabled,
                ),
                Step(
                  title: Text('information_of_the_work_permit_grantor'.tr),
                  content: Column(
                    children: <Widget>[
                      FormBuilderTextField(
                        name: 'name_surname',
                        decoration: InputDecoration(labelText: 'name_and_surname'.tr),
                      ),
                      FormBuilderDateTimePicker(
                        name: 'date_of_grantor',
                        inputType: InputType.date,
                        format: DateFormat('yyyy-MM-dd'),
                        decoration: InputDecoration(labelText: 'date'.tr),
                        onChanged: (value) {
                          // Eğer değer null ise, null'a eşit olan bir DateTime nesnesi atayabilirsiniz.
                          // Bu şekilde hatayı önlemiş olursunuz.
                          if (value == null) {
                            // Örneğin:
                            value = DateTime.now();
                          }
                        },
                      ),
                    ],
                  ),
                  isActive: _currentStep >= 4,
                  state: _currentStep >= 4
                      ? StepState.complete
                      : StepState.disabled,
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          heroTag: 'save',
          backgroundColor: Colors.deepOrange,
          onPressed: _submitForm,
          child: const Icon(Icons.save, color: Colors.white),
        ));
  }
}
