// ignore_for_file: use_key_in_widget_constructors, unnecessary_null_comparison, prefer_if_null_operators, unused_field, cast_from_null_always_fails

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class WorkPermitFormPage extends StatefulWidget {
  @override
  _WorkPermitFormPageState createState() => _WorkPermitFormPageState();
}

class _WorkPermitFormPageState extends State<WorkPermitFormPage> {
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
                  title: Text('Description of the Work to be Done'),
                  content: Column(
                    children: <Widget>[
                      FormBuilderTextField(
                        name: 'description_of_work_to_be_done',
                        decoration: InputDecoration(
                            labelText: 'Description of the Work to be Done'),
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
                  state: _currentStep >= 0
                      ? StepState.complete
                      : StepState.disabled,
                ),
                Step(
                  title: Text('Select Working Type'),
                  content: Column(
                    children: <Widget>[
                      FormBuilderCheckboxGroup(
                          enabled: true,
                          checkColor: Colors.white,
                          activeColor: Colors.deepOrange,
                          name: 'working_type',
                          options: const [
                            FormBuilderFieldOption(value: 'Working at Height'),
                            FormBuilderFieldOption(
                                value: 'Excavation/Earthworks'),
                            FormBuilderFieldOption(
                                value: 'Electrical Works/Working Under Energy'),
                            FormBuilderFieldOption(
                                value: 'Flame Cutting/Welding'),
                            FormBuilderFieldOption(
                                value:
                                    'Hot Works - Welding, Cutting, Grinding'),
                            FormBuilderFieldOption(
                                value:
                                    'Machine Maintenance/Repair/Working with Moving Machines'),
                            FormBuilderFieldOption(
                                value:
                                    'Steam, Compressed Air and Gas Installation Works'),
                            FormBuilderFieldOption(
                                value: 'Working with Lifting Equipment'),
                            FormBuilderFieldOption(
                                value: 'Working in Confined Spaces'),
                            FormBuilderFieldOption(
                                value:
                                    'Disabling Fire Detection / Extinguishing Systems'),
                            FormBuilderFieldOption(
                                value: 'Working with Chemicals'),
                            FormBuilderFieldOption(
                                value:
                                    ' Other (Steel Construction Disassembly/Installation.)'),
                          ])
                    ],
                  ),
                  isActive: _currentStep >= 1,
                  state: _currentStep >= 1
                      ? StepState.complete
                      : StepState.disabled,
                ),
                Step(
                  title: Text('Risk Assessment'),
                  content: SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        FormBuilderTextField(
                          maxLength: 100,
                          maxLines: 1,
                          name: 'work_to_do',
                          decoration: InputDecoration(labelText: 'Work to do'),
                        ),
                        FormBuilderTextField(
                          maxLength: 1000,
                          maxLines: 4,
                          name: 'danger',
                          decoration: InputDecoration(labelText: 'Dangers'),
                        ),
                        FormBuilderTextField(
                          maxLength: 1500,
                          maxLines: 4,
                          name: 'precautions_to_take',
                          decoration:
                              InputDecoration(labelText: 'Precautions to take'),
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
                  title: Text('Personal Protective Equipment to be Used'),
                  content: Column(
                    children: <Widget>[
                      FormBuilderCheckboxGroup(
                          enabled: true,
                          checkColor: Colors.white,
                          activeColor: Colors.deepOrange,
                          name: 'ppe_to_be_used',
                          options: const [
                            FormBuilderFieldOption(value: 'Work clothest'),
                            FormBuilderFieldOption(value: 'Work shoes'),
                            FormBuilderFieldOption(value: 'Work gloves'),
                            FormBuilderFieldOption(value: 'Welder mask'),
                            FormBuilderFieldOption(value: 'Goggles'),
                            FormBuilderFieldOption(value: 'Dust mask'),
                            FormBuilderFieldOption(value: 'Safety belt'),
                            FormBuilderFieldOption(value: 'Facial Wall'),
                            FormBuilderFieldOption(
                                value: 'Headphone protector'),
                            FormBuilderFieldOption(value: 'Fire extinguisher'),
                            FormBuilderFieldOption(value: 'Hard hat'),
                            FormBuilderFieldOption(value: 'Other'),
                          ])
                    ],
                  ),
                  isActive: _currentStep >= 3,
                  state: _currentStep >= 3
                      ? StepState.complete
                      : StepState.disabled,
                ),
                Step(
                  title: Text('Information of the Work Permit Grantor'),
                  content: Column(
                    children: <Widget>[
                      FormBuilderTextField(
                        name: 'name_surname',
                        decoration: InputDecoration(labelText: 'Name Surname'),
                      ),
                      FormBuilderDateTimePicker(
                        name: 'date',
                        inputType: InputType.date,
                        format: DateFormat('yyyy-MM-dd'),
                        decoration: InputDecoration(labelText: 'Date'),
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
