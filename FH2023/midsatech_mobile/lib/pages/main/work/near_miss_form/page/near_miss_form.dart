// ignore_for_file: use_key_in_widget_constructors, unnecessary_null_comparison, prefer_if_null_operators, unused_field, cast_from_null_always_fails

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class NearMissFormPage extends StatefulWidget {
  @override
  _NearMissFormPageState createState() => _NearMissFormPageState();
}

class _NearMissFormPageState extends State<NearMissFormPage> {
  final _formKey = GlobalKey<FormState>();
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
                      name: 'business_name',
                      decoration: InputDecoration(labelText: 'Business Name'),
                    ),
                    FormBuilderTextField(
                      name: 'location',
                      decoration: InputDecoration(labelText: 'Location'),
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
                title: Text('Information About The Survivor'),
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
                    FormBuilderTextField(
                      name: 'phone',
                      decoration: InputDecoration(labelText: 'Phone Number'),
                    ),
                    FormBuilderTextField(
                      name: 'email',
                      decoration: InputDecoration(labelText: 'E-Mail Address'),
                    ),
                  ],
                ),
                isActive: _currentStep >= 1,
                state:
                    _currentStep >= 1 ? StepState.complete : StepState.disabled,
              ),
              Step(
                title: Text('Description of the Incident/Dangerous Situation'),
                content: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      FormBuilderTextField(
                        maxLength: 2000,
                        maxLines: 6,
                        name: 'description',
                        decoration: InputDecoration(
                            labelText: 'Description of the Incident'),
                      ),
                      FormBuilderTextField(
                        maxLength: 2000,
                        maxLines: 6,
                        name: 'solution',
                        decoration:
                            InputDecoration(labelText: 'What is the Solution?'),
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
                  children: <Widget>[
                    FormBuilderCheckbox(
                      name: 'near_miss_incident',
                      title: Text('Near Miss Incident'),
                    ),
                    FormBuilderCheckbox(
                      name: 'dangerous_situation',
                      title: Text('Dangerous Situation'),
                    )
                  ],
                ),
                isActive: _currentStep >= 3,
                state:
                    _currentStep >= 3 ? StepState.complete : StepState.disabled,
              ),
              Step(
                title: Text('Opinion Of The Unit Responsible'),
                content: Column(
                  children: <Widget>[
                    FormBuilderTextField(
                      maxLength: 2000,
                      maxLines: 6,
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
