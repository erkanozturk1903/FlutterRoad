// ignore_for_file: use_build_context_synchronously, avoid_single_cascade_in_expression_statements

import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
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
      Map<String, dynamic> formData, List<XFile>? imageFileList) async {
    // Debug: Form verilerini konsola yazdır
    print("Form Data: $formData");

    // Burada, IsKazasiReport modelinizin 'fromForm' metodunu çağırıyoruz.
    // Bu örnekte, metodunuzun form verilerini ve resim listesini alıp bir IsKazasiReport nesnesine dönüştürdüğünü varsayıyoruz.
    final IsKazasiReport isKazasiReport =
        IsKazasiReport.fromForm(formData, imageFileList);

    // Debug: Dönüştürülen IsKazasiReport nesnesinin haritasını konsola yazdır
    print("IsKazasiReport toMap: ${isKazasiReport.toMap()}");

    try {
      // Veritabanına kaydet
      await FirebaseFirestore.instance
          .collection('midsatech')
          .doc('customers')
          .collection('administrator')
          .doc('is_kazasi_report')
          .collection('reports')
          .add(isKazasiReport.toMap());
      print('Form submitted successfully');
    } catch (e) {
      print('Error submitting form: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF021734),
        foregroundColor: Colors.white,
        title: Text(
          'work_accident_form'.tr,
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
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                              Colors.deepOrange,
                            ),
                          ),
                          onPressed: () {
                            _currentStep < 14
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
                title: Text('workplace_information'.tr),
                content: Column(
                  children: [
                    FormBuilderCheckboxGroup(
                      name: 'employer_type',
                      options:  [
                        FormBuilderFieldOption(
                          value: 'principal_employer'.tr,
                        ),
                        FormBuilderFieldOption(
                          value: 'sub_employer'.tr,
                        ),
                        FormBuilderFieldOption(
                          value: 'other'.tr,
                        ),
                      ],
                    ),
                    FormBuilderTextField(
                      name: 'business_name',
                      decoration:
                      InputDecoration(labelText: 'business_name'.tr),
                    ),
                  ],
                ),
                isActive: _currentStep >= 0,
                state:
                    _currentStep >= 0 ? StepState.complete : StepState.disabled,
              ),
              Step(
                title: Text('accident_incident_information'.tr),
                content: Column(
                  children: [
                    FormBuilderTextField(
                      name: 'accident_number',
                      decoration:
                      InputDecoration(labelText: 'accident_number'.tr),
                    ),
                    FormBuilderTextField(
                      name: 'accident_location',
                      decoration:
                      InputDecoration(labelText: 'accident_location'),
                    ),
                    FormBuilderDateTimePicker(
                      name: 'accident_date',
                      inputType: InputType.date,
                      format: DateFormat('yyyy-MM-dd'),
                      decoration: InputDecoration(labelText: 'date'.tr),
                    ),
                    FormBuilderDateTimePicker(
                      name: 'accident_time',
                      inputType: InputType.time,
                      format: DateFormat('HH:mm'),
                      decoration:  InputDecoration(labelText: 'time'.tr),
                    ),
                    FormBuilderTextField(
                      name: 'activity',
                      decoration: InputDecoration(labelText: 'activity'.tr),
                    ),
                    FormBuilderTextField(
                      name: 'shift',
                      decoration:  InputDecoration(labelText: 'shift'.tr),
                    ),
                  ],
                ),
                isActive: _currentStep >= 1,
                state:
                    _currentStep >= 1 ? StepState.complete : StepState.disabled,
              ),
              Step(
                title: Text('information_regarding_the_victim'.tr),
                content: Column(
                  children: [
                    FormBuilderTextField(
                      name: 'name_surname',
                      decoration:
                      InputDecoration(labelText: 'name_and_surname'.tr),
                    ),
                    FormBuilderTextField(
                      name: 'department_work_information',
                      decoration: InputDecoration(
                          labelText: 'department_work_information'.tr),
                    ),
                    FormBuilderTextField(
                      name: 'identification_number',
                      decoration: InputDecoration(
                          labelText: 'identification_number'.tr),
                    ),
                    FormBuilderDateTimePicker(
                      name: 'start_date_of_work',
                      inputType: InputType.date,
                      format: DateFormat('yyyy-MM-dd'),
                      decoration: InputDecoration(
                          labelText: 'start_date_of_work'.tr),
                    ),
                    FormBuilderDateTimePicker(
                      name: 'date_of_birth',
                      inputType: InputType.date,
                      format: DateFormat('yyyy-MM-dd'),
                      decoration:
                      InputDecoration(labelText: 'date_of_birth'.tr),
                    ),
                  ],
                ),
                isActive: _currentStep >= 2,
                state:
                    _currentStep >= 2 ? StepState.complete : StepState.disabled,
              ),
              Step(
                title: Text('post_accident_procedures'.tr),
                content: Column(
                  children: [
                    FormBuilderTextField(
                      maxLines: 5,
                      name: 'post_accident_procedures',
                      decoration: InputDecoration(
                          labelText: 'post_accident_procedures'.tr),
                    ),
                  ],
                ),
                isActive: _currentStep >= 3,
                state:
                    _currentStep >= 3 ? StepState.complete : StepState.disabled,
              ),
              Step(
                title: Text('Accident Incident Type'),
                content: FormBuilderCheckboxGroup(
                  name: 'accident_incident_type',
                  options: [
                    FormBuilderFieldOption(value: 'slip_fall_crash'.tr),
                    FormBuilderFieldOption(value: 'falling_from_high'.tr),
                    FormBuilderFieldOption(value: 'object_impact_fall'.tr),
                    FormBuilderFieldOption(value: 'crush_jam_cut'.tr),
                    FormBuilderFieldOption(value: 'burr_dust_formation'.tr),
                    FormBuilderFieldOption(value: 'combustion_explosion'.tr),
                    FormBuilderFieldOption(value: 'electric_shock'.tr),
                    FormBuilderFieldOption(value: 'hot_welding_work'.tr),
                    FormBuilderFieldOption(value: 'landslide_collapse'.tr),
                    FormBuilderFieldOption(value: 'poisoning'.tr),
                    FormBuilderFieldOption(value: 'chemical_exposure'.tr),
                    FormBuilderFieldOption(value: 'traffic_accident'.tr),
                    FormBuilderFieldOption(value: 'other'.tr),
                  ],
                ),
                isActive: _currentStep >= 4,
                state:
                    _currentStep >= 4 ? StepState.complete : StepState.disabled,
              ),
              Step(
                title: Text('affected_area'.tr),
                content: Column(
                  children: [
                    FormBuilderCheckboxGroup(
                      name: 'affected_area',
                      options: [
                        FormBuilderFieldOption(value: 'head'.tr),
                        FormBuilderFieldOption(value: 'neck'.tr),
                        FormBuilderFieldOption(value: 'eye'.tr),
                        FormBuilderFieldOption(value: 'face'.tr),
                        FormBuilderFieldOption(value: 'backs'.tr),
                        FormBuilderFieldOption(value: 'body'.tr),
                        FormBuilderFieldOption(value: 'hand'.tr),
                        FormBuilderFieldOption(value: 'foot'.tr),
                        FormBuilderFieldOption(value: 'leg'.tr),
                        FormBuilderFieldOption(value: 'whole_body'.tr),
                        FormBuilderFieldOption(value: 'other'.tr),
                      ],
                    )
                  ],
                ),
                isActive: _currentStep >= 5,
                state:
                    _currentStep >= 5 ? StepState.complete : StepState.disabled,
              ),
              Step(
                title: Text('cause_of_accident_incident_one'.tr),
                content: Column(
                  children: [
                    FormBuilderCheckboxGroup(
                      name: 'accident_cause_employed',
                      options: [
                        FormBuilderFieldOption(
                            value: 'failure_to_comply_with_the_rules'.tr),
                        FormBuilderFieldOption(
                            value: 'absentmindedness_carelessness'.tr),
                        FormBuilderFieldOption(value: 'fatigue'.tr),
                        FormBuilderFieldOption(
                            value: 'operation_without_protection'.tr),
                        FormBuilderFieldOption(value: 'not_using_ppe'.tr),
                        FormBuilderFieldOption(value: 'using_faulty_equipment'.tr),
                        FormBuilderFieldOption(
                            value: 'working_outside_of_duty'.tr),
                        FormBuilderFieldOption(value: 'other'.tr),
                      ],
                    )
                  ],
                ),
                isActive: _currentStep >= 6,
                state:
                    _currentStep >= 6 ? StepState.complete : StepState.disabled,
              ),
              Step(
                title: Text('cause_of_accident_incident_two'.tr),
                content: Column(
                  children: [
                    FormBuilderCheckboxGroup(
                      name: 'accident_cause_equipment',
                      options: [
                        FormBuilderFieldOption(value: 'unsuitable_equipment'.tr),
                        FormBuilderFieldOption(
                            value: 'lack_of_periodic_control'.tr),
                        FormBuilderFieldOption(
                            value: 'lack_of_maintenance_macinery_equitment'.tr),
                        FormBuilderFieldOption(
                            value: 'missing_and_defective_protectors'.tr),
                        FormBuilderFieldOption(value: 'unsecured_equipment'.tr),
                        FormBuilderFieldOption(value: 'ungrounded_equipment'.tr),
                        FormBuilderFieldOption(value: 'isolation_disorder'.tr),
                        FormBuilderFieldOption(
                            value: 'improper_equipment_placement'.tr),
                        FormBuilderFieldOption(value: 'other'.tr),
                      ],
                    )
                  ],
                ),
                isActive: _currentStep >= 7,
                state:
                    _currentStep >= 7 ? StepState.complete : StepState.disabled,
              ),
              Step(
                title: Text('cause_of_accident_incident_three'.tr),
                content: Column(
                  children: [
                    FormBuilderCheckboxGroup(
                      name: 'working_environment',
                      options: [
                        FormBuilderFieldOption(
                            value: 'disorganized_working_environment'.tr),
                        FormBuilderFieldOption(value: 'lack_of_safety_sign'.tr),
                        FormBuilderFieldOption(value: 'lack_of_instructions'.tr),
                        FormBuilderFieldOption(value: 'insufficient_lighting'.tr),
                        FormBuilderFieldOption(
                            value: 'ergonomic_inconvenience'.tr),
                        FormBuilderFieldOption(value: 'unsafe_stacking'),
                        FormBuilderFieldOption(value: 'noise'.tr),
                        FormBuilderFieldOption(value: 'electricity'.tr),
                        FormBuilderFieldOption(value: 'other'.tr),
                      ],
                    )
                  ],
                ),
                isActive: _currentStep >= 8,
                state:
                    _currentStep >= 8 ? StepState.complete : StepState.disabled,
              ),
              Step(
                title: Text('accident_incident_photos'.tr),
                content: Row(
                  children: [
                    Container(
                      color: Colors.grey[200],
                      height: 150,
                      width: 150,
                      child: imageFileList != null
                          ? prewiewImages()
                          : Center(
                              child: Text('no_selected_image'.tr),
                            ),
                    )
                  ],
                ),
                isActive: _currentStep >= 9,
                state:
                    _currentStep >= 9 ? StepState.complete : StepState.disabled,
              ),
              Step(
                title: Text('accident_result_report'.tr),
                content: Column(
                  children: [
                    FormBuilderTextField(
                      name: 'accident_result_report',
                      decoration:
                           InputDecoration(labelText: 'accident_result'.tr),
                    ),
                    FormBuilderTextField(
                      name: 'number_of_report_days',
                      decoration: InputDecoration(
                          labelText: 'number_of_report_days'.tr),
                    ),
                    FormBuilderTextField(
                      name: 'hospital_name',
                      decoration:
                      InputDecoration(labelText: 'hospital_name'.tr),
                    ),
                  ],
                ),
                isActive: _currentStep >= 10,
                state: _currentStep >= 10
                    ? StepState.complete
                    : StepState.disabled,
              ),
              Step(
                title: Text('accident_result_incident'.tr),
                content: Column(
                  children: [
                    FormBuilderCheckboxGroup(
                      name: 'accident_result',
                      options: [
                        FormBuilderFieldOption(value: 'no_loss'.tr),
                        FormBuilderFieldOption(
                            value: 'accident_with_material_damage'.tr),
                        FormBuilderFieldOption(value: 'minor_injury'.tr),
                        FormBuilderFieldOption(value: 'serious_injury'.tr),
                        FormBuilderFieldOption(value: 'loss_off_limb'.tr),
                        FormBuilderFieldOption(value: 'loss_of_life'.tr),
                        FormBuilderFieldOption(value: 'no_treatment_required'.tr),
                        FormBuilderFieldOption(
                            value: 'occupational_medicine_treatment'.tr),
                        FormBuilderFieldOption(value: 'hospital'.tr),
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
                title: Text('nonconformities_caused_accident'.tr),
                content: Column(
                  children: [
                    FormBuilderTextField(
                      maxLines: 5,
                      name: 'nonconformities_caused_accident',
                      decoration: InputDecoration(
                          labelText:
                              'nonconformities_caused_accident'.tr),
                    ),
                  ],
                ),
                isActive: _currentStep >= 12,
                state: _currentStep >= 12
                    ? StepState.complete
                    : StepState.disabled,
              ),
              Step(
                title: Text('corrective_preventive_actions'.tr),
                content: Column(
                  children: [
                    FormBuilderTextField(
                      maxLines: 5,
                      name: 'corrective_preventive_actions',
                      decoration: InputDecoration(
                          labelText: 'corrective_preventive_actions'.tr),
                    ),
                  ],
                ),
                isActive: _currentStep >= 13,
                state: _currentStep >= 13
                    ? StepState.complete
                    : StepState.disabled,
              ),
              Step(
                title: Text('investigation_team'.tr),
                content: Column(
                  children: [
                    FormBuilderTextField(
                      name: 'investing_name_surname',
                      decoration:
                      InputDecoration(labelText: 'name_and_surname'.tr),
                    ),
                    FormBuilderTextField(
                      name: 'position',
                      decoration: InputDecoration(labelText: 'position'.tr),
                    ),
                    FormBuilderDateTimePicker(
                      name: 'date',
                      inputType: InputType.date,
                      format: DateFormat('yyyy-MM-dd'),
                      decoration:  InputDecoration(labelText: 'date'.tr),
                    ),
                    FormBuilderTextField(
                      name: 'signature',
                      decoration: InputDecoration(labelText: 'signature'.tr),
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
                _formKey.currentState!.save();
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
