import 'package:cloud_firestore/cloud_firestore.dart';

class FieldSurveillanceFormModel {
  late String detecting;
  late String preparedBy;
  late String reportNumber;
  late DateTime date;
  late String definitionOfNonconformity;
  late String reasonForNonconformity;
  late String addressOfUnit;
  late String responsibleUnit;
  late List<String> imageUrls;
  late int selectedPossibility;
  late int selectedViolence;
  late int riskAssessment;
  late String opinionOfTheUnitResponsible;

  FieldSurveillanceFormModel(
      {required this.detecting,
      required this.preparedBy,
      required this.reportNumber,
      required this.date,
      required this.definitionOfNonconformity,
      required this.reasonForNonconformity,
      required this.addressOfUnit,
      required this.responsibleUnit,
      required this.imageUrls,
      required this.selectedPossibility,
      required this.selectedViolence,
      required this.riskAssessment,
      required this.opinionOfTheUnitResponsible});

  Map<String, dynamic> toMap() {
    return {
      'detecting': detecting,
      'preparedBy': preparedBy,
      'reportNumber': reportNumber,
      'date': date,
      'definitionOfNonconformity': definitionOfNonconformity,
      'reasonForNonconformity': reasonForNonconformity,
      'addressOfUnit': addressOfUnit,
      'responsibleUnit': responsibleUnit,
      'imageUrls': imageUrls,
      'selectedPossibility': selectedPossibility,
      'selectedViolence': selectedViolence,
      'riskAssessment': riskAssessment,
      'opinionOfTheUnitResponsible': opinionOfTheUnitResponsible,
    };
  }

  factory FieldSurveillanceFormModel.fromMap(Map<String, dynamic> map) {
    return FieldSurveillanceFormModel(
      detecting: map['detecting'],
      preparedBy: map['preparedBy'],
      reportNumber: map['reportNumber'],
      date: (map['date'] as Timestamp).toDate(),
      definitionOfNonconformity: map['definitionOfNonconformity'],
      reasonForNonconformity: map['reasonForNonconformity'],
      addressOfUnit: map['addressOfUnit'],
      responsibleUnit: map['responsibleUnit'],
      imageUrls: List<String>.from(map['imageUrls']),
      selectedPossibility: map['selectedPossibility'],
      selectedViolence: map['selectedViolence'],
      riskAssessment: map['riskAssessment'],
      opinionOfTheUnitResponsible: map['opinionOfTheUnitResponsible'],
    );
  }
}
