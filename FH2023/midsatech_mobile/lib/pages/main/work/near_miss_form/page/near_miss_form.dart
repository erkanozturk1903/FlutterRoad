// ignore_for_file: use_key_in_widget_constructors, unnecessary_null_comparison, prefer_if_null_operators, unused_field, cast_from_null_always_fails

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:midsatech_mobile/pages/main/work/near_miss_form/models/near_miss_model.dart';

class NearMissFormPage extends StatefulWidget {
  @override
  _NearMissFormPageState createState() => _NearMissFormPageState();
}

class _NearMissFormPageState extends State<NearMissFormPage> {
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
      final nearMissData = NearMissFormData(
        businessName: formData['business_name'] ?? '',
        location: formData['location'] ?? '',
        date: formData['date'] ?? DateTime.now(),
        adi: formData['adi'] ?? '',
        mission: formData['mission'] ?? '',
        unit: formData['unit'] ?? '',
        phone: formData['phone'] ?? '',
        email: formData['email'] ?? '',
        description: formData['description'] ?? '',
        solution: formData['solution'] ?? '',
        nearMissIncident: formData['near_miss_incident'] ?? false,
        dangerousSituation: formData['dangerous_situation'] ?? false,
        opinionUnitResponsible: formData['opinion_unit_responsible'] ?? '',
        imageUrls: imageFileList!.map((file) => file.path).toList(),
      );

      try {
        await FirebaseFirestore.instance.collection('near_miss_forms').add(
              nearMissData.toMap(),
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
                ],
              );
            },
            steps: <Step>[
              Step(
                title: Text('general_information'.tr),
                content: Column(
                  children: <Widget>[
                    FormBuilderTextField(
                      name: 'business_name',
                      decoration:
                          InputDecoration(labelText: 'business_name'.tr),
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
                state:
                    _currentStep >= 0 ? StepState.complete : StepState.disabled,
              ),
              Step(
                title: Text('information_about_the_survivor'.tr),
                content: Column(
                  children: <Widget>[
                    FormBuilderTextField(
                      name: 'adi',
                      decoration:
                          InputDecoration(labelText: 'name_and_surname'.tr),
                    ),
                    FormBuilderTextField(
                      name: 'mission',
                      decoration: InputDecoration(labelText: 'mission'.tr),
                    ),
                    FormBuilderTextField(
                      name: 'unit',
                      decoration: InputDecoration(labelText: 'unit_of_work'.tr),
                    ),
                    FormBuilderTextField(
                      name: 'phone',
                      decoration: InputDecoration(labelText: 'phone'.tr),
                    ),
                    FormBuilderTextField(
                      name: 'email',
                      decoration: InputDecoration(labelText: 'email'.tr),
                    ),
                  ],
                ),
                isActive: _currentStep >= 1,
                state:
                    _currentStep >= 1 ? StepState.complete : StepState.disabled,
              ),
              Step(
                title: Text('description_of_the_incident_dangerous'.tr),
                content: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      FormBuilderTextField(
                        maxLength: 2000,
                        maxLines: 6,
                        name: 'description',
                        decoration: InputDecoration(
                            labelText: 'description_of_the_incident'.tr),
                      ),
                      FormBuilderTextField(
                        maxLength: 2000,
                        maxLines: 6,
                        name: 'solution',
                        decoration: InputDecoration(
                            labelText: 'what_is_the_solution'.tr),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
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
                  children: <Widget>[
                    FormBuilderCheckbox(
                      name: 'near_miss_incident',
                      title: Text('near_miss_incident'.tr),
                    ),
                    FormBuilderCheckbox(
                      name: 'dangerous_situation',
                      title: Text('dangerous_situation'.tr),
                    )
                  ],
                ),
                isActive: _currentStep >= 3,
                state:
                    _currentStep >= 3 ? StepState.complete : StepState.disabled,
              ),
              Step(
                title: Text('opinion_of_the_unit_responsible'.tr),
                content: Column(
                  children: <Widget>[
                    FormBuilderTextField(
                      maxLength: 2000,
                      maxLines: 6,
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
