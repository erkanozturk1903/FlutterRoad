// ignore_for_file: use_build_context_synchronously

import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:midsatech_mobile/pages/main/work/work_accident/models/is_kazasi_model.dart';

class IsKazasiFormPage extends StatefulWidget {
  @override
  _IsKazasiFormPageState createState() => _IsKazasiFormPageState();
}

class _IsKazasiFormPageState extends State<IsKazasiFormPage> {
  final _formKey = GlobalKey<FormBuilderState>();
  int _currentStep = 0;
  final ImagePicker _picker = ImagePicker();
  List<XFile>? imageFileList = [];
  dynamic _pickImageError;

/* final CollectionReference usersCollection =
      FirebaseFirestore.instance.

 */

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

  Future<void> submitForm(
      Map<String, dynamic> data, List<XFile>? imageFileList) async {
    final IsKazasiReport isKazasiReport =
        IsKazasiReport.fromForm(data, imageFileList);
    await FirebaseFirestore.instance
        .collection('midsatech')
        .doc('customers')
        .collection('users')
        .doc('is_kazasi_report')
        .set(isKazasiReport.toMap());
  }

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
                  _currentStep == 14
                      ? const SizedBox()
                      : TextButton(
                          onPressed: () {
                            _currentStep < 14
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
                title: Text('Workplace Information'),
                content: Column(
                  children: [
                    FormBuilderCheckboxGroup(
                      name: 'employer_type',
                      options: const [
                        FormBuilderFieldOption(
                          value: 'Principal Employer',
                        ),
                        FormBuilderFieldOption(
                          value: 'Sub-Employer',
                        ),
                        FormBuilderFieldOption(
                          value: 'Other',
                        ),
                      ],
                    ),
                    FormBuilderTextField(
                      name: 'business_name',
                      decoration:
                          const InputDecoration(labelText: 'Business Name'),
                    ),
                  ],
                ),
                isActive: _currentStep >= 0,
                state:
                    _currentStep >= 0 ? StepState.complete : StepState.disabled,
              ),
              Step(
                title: Text('Accident Incident Information'),
                content: Column(
                  children: [
                    FormBuilderTextField(
                      name: 'accident_number',
                      decoration:
                          const InputDecoration(labelText: 'Accident Number'),
                    ),
                    FormBuilderTextField(
                      name: 'accident_location',
                      decoration:
                          const InputDecoration(labelText: 'Accident Location'),
                    ),
                    FormBuilderDateTimePicker(
                      name: 'accident_date',
                      inputType: InputType.date,
                      format: DateFormat('yyyy-MM-dd'),
                      decoration: const InputDecoration(labelText: 'Date'),
                    ),
                    FormBuilderDateTimePicker(
                      name: 'accident_time',
                      inputType: InputType.time,
                      format: DateFormat('HH:mm'),
                      decoration: const InputDecoration(labelText: 'Time'),
                    ),
                    FormBuilderTextField(
                      name: 'activity',
                      decoration: const InputDecoration(labelText: 'Activity'),
                    ),
                    FormBuilderTextField(
                      name: 'shift',
                      decoration: const InputDecoration(labelText: 'Shift'),
                    ),
                  ],
                ),
                isActive: _currentStep >= 1,
                state:
                    _currentStep >= 1 ? StepState.complete : StepState.disabled,
              ),
              Step(
                title: Text('Information Regarding the Victim'),
                content: Column(
                  children: [
                    FormBuilderTextField(
                      name: 'name_surname',
                      decoration:
                          const InputDecoration(labelText: 'Name Surname'),
                    ),
                    FormBuilderTextField(
                      name: 'department_work_information',
                      decoration: const InputDecoration(
                          labelText: 'Department Work Information'),
                    ),
                    FormBuilderTextField(
                      name: 'identification_number',
                      decoration: const InputDecoration(
                          labelText: 'Identification Number'),
                    ),
                    FormBuilderDateTimePicker(
                      name: 'start_date_of_work',
                      inputType: InputType.date,
                      format: DateFormat('yyyy-MM-dd'),
                      decoration: const InputDecoration(
                          labelText: 'Start Date Of Work'),
                    ),
                    FormBuilderDateTimePicker(
                      name: 'date_of_birth',
                      inputType: InputType.date,
                      format: DateFormat('yyyy-MM-dd'),
                      decoration:
                          const InputDecoration(labelText: 'Date Of Birth'),
                    ),
                  ],
                ),
                isActive: _currentStep >= 2,
                state:
                    _currentStep >= 2 ? StepState.complete : StepState.disabled,
              ),
              Step(
                title: Text('Post Accident Procedures'),
                content: Column(
                  children: [
                    FormBuilderTextField(
                      maxLines: 5,
                      name: 'post_accident_procedures',
                      decoration: const InputDecoration(
                          labelText: 'Post Accident Procedures'),
                    ),
                  ],
                ),
                isActive: _currentStep >= 3,
                state:
                    _currentStep >= 3 ? StepState.complete : StepState.disabled,
              ),
              Step(
                title: Text('Accident Incident Type'),
                content: Column(
                  children: [
                    FormBuilderCheckboxGroup(
                      name: 'accident_incident_type',
                      options: const [
                        FormBuilderFieldOption(value: 'Slip/Fall/Crash'),
                        FormBuilderFieldOption(value: 'Falling from high'),
                        FormBuilderFieldOption(value: 'Object impact/fall'),
                        FormBuilderFieldOption(value: 'Crush/Jam/Cut'),
                        FormBuilderFieldOption(value: 'Burr/Dust formation'),
                        FormBuilderFieldOption(value: 'Combustion/Explosion'),
                        FormBuilderFieldOption(value: 'Electric shock'),
                        FormBuilderFieldOption(value: 'Hot/Welding work'),
                        FormBuilderFieldOption(value: 'Landslide/Collapse'),
                        FormBuilderFieldOption(value: 'Poisoning'),
                        FormBuilderFieldOption(value: 'Chemical Exposure'),
                        FormBuilderFieldOption(value: 'Traffic Accident'),
                        FormBuilderFieldOption(value: 'Other'),
                      ],
                    )
                  ],
                ),
                isActive: _currentStep >= 4,
                state:
                    _currentStep >= 4 ? StepState.complete : StepState.disabled,
              ),
              Step(
                title: Text('Affected Area'),
                content: Column(
                  children: [
                    FormBuilderCheckboxGroup(
                      name: 'affected_area',
                      options: const [
                        FormBuilderFieldOption(value: 'Head'),
                        FormBuilderFieldOption(value: 'Neck'),
                        FormBuilderFieldOption(value: 'Eye'),
                        FormBuilderFieldOption(value: 'Face'),
                        FormBuilderFieldOption(value: 'Back'),
                        FormBuilderFieldOption(value: 'Body'),
                        FormBuilderFieldOption(value: 'Hand'),
                        FormBuilderFieldOption(value: 'Foot'),
                        FormBuilderFieldOption(value: 'Leg'),
                        FormBuilderFieldOption(value: 'Whole body'),
                        FormBuilderFieldOption(value: 'Other'),
                      ],
                    )
                  ],
                ),
                isActive: _currentStep >= 5,
                state:
                    _currentStep >= 5 ? StepState.complete : StepState.disabled,
              ),
              Step(
                title: Text('Cause of Accident Incident 1'),
                content: Column(
                  children: [
                    FormBuilderCheckboxGroup(
                      name: 'accident_cause_employed',
                      options: const [
                        FormBuilderFieldOption(
                            value: 'Failure to comply with the rules'),
                        FormBuilderFieldOption(
                            value: 'Absentmindedness/Carelessness'),
                        FormBuilderFieldOption(value: 'Fatigue'),
                        FormBuilderFieldOption(
                            value: 'Operation without protection'),
                        FormBuilderFieldOption(value: 'Not using PPE'),
                        FormBuilderFieldOption(value: 'Using faulty equipment'),
                        FormBuilderFieldOption(
                            value: 'Working outside of duty'),
                        FormBuilderFieldOption(value: 'Other'),
                      ],
                    )
                  ],
                ),
                isActive: _currentStep >= 6,
                state:
                    _currentStep >= 6 ? StepState.complete : StepState.disabled,
              ),
              Step(
                title: Text('Cause of Accident Incident 2'),
                content: Column(
                  children: [
                    FormBuilderCheckboxGroup(
                      name: 'accident_cause_equipment',
                      options: const [
                        FormBuilderFieldOption(value: 'Unsuitable equipment'),
                        FormBuilderFieldOption(
                            value: 'Lack of periodic control'),
                        FormBuilderFieldOption(
                            value: 'Lack of maintenance machinery/equipment'),
                        FormBuilderFieldOption(
                            value: 'Missing and defective protectors'),
                        FormBuilderFieldOption(value: 'Unsecured equipment'),
                        FormBuilderFieldOption(value: 'Ungrounded equipment'),
                        FormBuilderFieldOption(value: 'Isolation disorder'),
                        FormBuilderFieldOption(
                            value: 'Improper equipment placement'),
                        FormBuilderFieldOption(value: 'Other'),
                      ],
                    )
                  ],
                ),
                isActive: _currentStep >= 7,
                state:
                    _currentStep >= 7 ? StepState.complete : StepState.disabled,
              ),
              Step(
                title: Text('Cause of Accident Incident 3'),
                content: Column(
                  children: [
                    FormBuilderCheckboxGroup(
                      name: 'working_environment',
                      options: const [
                        FormBuilderFieldOption(
                            value: 'Disorganized working environment'),
                        FormBuilderFieldOption(value: 'Lack of safety sign'),
                        FormBuilderFieldOption(value: 'Lack of instructions'),
                        FormBuilderFieldOption(value: 'Insufficient lighting'),
                        FormBuilderFieldOption(
                            value: 'Ergonomic inconvenience'),
                        FormBuilderFieldOption(value: 'Unsafe stacking'),
                        FormBuilderFieldOption(value: 'Noise'),
                        FormBuilderFieldOption(value: 'Electricity'),
                        FormBuilderFieldOption(value: 'Other'),
                      ],
                    )
                  ],
                ),
                isActive: _currentStep >= 8,
                state:
                    _currentStep >= 8 ? StepState.complete : StepState.disabled,
              ),
              Step(
                title: Text('Accident Incident Photos'),
                content: Row(
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
                ),
                isActive: _currentStep >= 9,
                state:
                    _currentStep >= 9 ? StepState.complete : StepState.disabled,
              ),
              Step(
                title: Text('Accident Incident Result Report'),
                content: Column(
                  children: [
                    FormBuilderTextField(
                      name: 'accident_result_report',
                      decoration:
                          const InputDecoration(labelText: 'Accident Result'),
                    ),
                    FormBuilderTextField(
                      name: 'number_of_report_days',
                      decoration: const InputDecoration(
                          labelText: 'Number of Report Days'),
                    ),
                    FormBuilderTextField(
                      name: 'hospital_name',
                      decoration:
                          const InputDecoration(labelText: 'Hospital Name'),
                    ),
                  ],
                ),
                isActive: _currentStep >= 10,
                state: _currentStep >= 10
                    ? StepState.complete
                    : StepState.disabled,
              ),
              Step(
                title: Text('Accident Incident Result'),
                content: Column(
                  children: [
                    FormBuilderCheckboxGroup(
                      name: 'accident_result',
                      options: const [
                        FormBuilderFieldOption(value: 'No loss'),
                        FormBuilderFieldOption(
                            value: 'Accident with material damage'),
                        FormBuilderFieldOption(value: 'Minor injury'),
                        FormBuilderFieldOption(value: 'Serious injury'),
                        FormBuilderFieldOption(value: 'Loss of limb'),
                        FormBuilderFieldOption(value: 'Loss of life'),
                        FormBuilderFieldOption(value: 'No treatment required'),
                        FormBuilderFieldOption(
                            value: 'Occupational medicine (treatment)'),
                        FormBuilderFieldOption(value: 'Hospital'),
                      ],
                    )
                  ],
                ),
                isActive: _currentStep >= 11,
                state: _currentStep >= 11
                    ? StepState.complete
                    : StepState.disabled,
              ),
              Step(
                title: Text('Nonconformities That Caused the Accident'),
                content: Column(
                  children: [
                    FormBuilderTextField(
                      maxLines: 5,
                      name: 'nonconformities_caused_accident',
                      decoration: const InputDecoration(
                          labelText:
                              'Nonconformities That Caused the Accident'),
                    ),
                  ],
                ),
                isActive: _currentStep >= 12,
                state: _currentStep >= 12
                    ? StepState.complete
                    : StepState.disabled,
              ),
              Step(
                title: Text('Corrective Preventive Actions'),
                content: Column(
                  children: [
                    FormBuilderTextField(
                      maxLines: 5,
                      name: 'corrective_preventive_actions',
                      decoration: const InputDecoration(
                          labelText: 'Corrective Preventive Actions'),
                    ),
                  ],
                ),
                isActive: _currentStep >= 13,
                state: _currentStep >= 13
                    ? StepState.complete
                    : StepState.disabled,
              ),
              Step(
                title: Text('Investigation Team'),
                content: Column(
                  children: [
                    FormBuilderTextField(
                      name: 'investing_name_surname',
                      decoration:
                          const InputDecoration(labelText: 'Name Surname'),
                    ),
                    FormBuilderTextField(
                      name: 'position',
                      decoration: const InputDecoration(labelText: 'Position'),
                    ),
                    FormBuilderDateTimePicker(
                      name: 'date',
                      inputType: InputType.date,
                      format: DateFormat('yyyy-MM-dd'),
                      decoration: const InputDecoration(labelText: 'Date'),
                    ),
                    FormBuilderTextField(
                      name: 'signature',
                      decoration: const InputDecoration(labelText: 'Signature'),
                    ),
                  ],
                ),
                isActive: _currentStep >= 14,
                state: _currentStep >= 14
                    ? StepState.complete
                    : StepState.disabled,
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
                final data = _formKey.currentState!.value;
                await submitForm(data, imageFileList);
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
