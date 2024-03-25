import 'package:cloud_firestore/cloud_firestore.dart';

class WorkPermitFormData {
  final String descriptionOfWorkToBeDone;
  final String location;
  final DateTime date;
  final List<String> workingType;
  final String workToDo;
  final String danger;
  final String precautionsToTake;
  final List<String> ppeToBeUsed;
  final String nameSurnameOfGrantor;
  final DateTime dateOfGrantor;

  WorkPermitFormData({
    required this.descriptionOfWorkToBeDone,
    required this.location,
    required this.date,
    required this.workingType,
    required this.workToDo,
    required this.danger,
    required this.precautionsToTake,
    required this.ppeToBeUsed,
    required this.nameSurnameOfGrantor,
    required this.dateOfGrantor,
  });

  Map<String, dynamic> toMap() {
    return {
      'descriptionOfWorkToBeDone': descriptionOfWorkToBeDone,
      'location': location,
      'date': date,
      'workingType': workingType,
      'workToDo': workToDo,
      'danger': danger,
      'precautionsToTake': precautionsToTake,
      'ppeToBeUsed': ppeToBeUsed,
      'nameSurnameOfGrantor': nameSurnameOfGrantor,
      'dateOfGrantor': dateOfGrantor,
    };
  }

  factory WorkPermitFormData.fromMap(Map<String, dynamic> map) {
    return WorkPermitFormData(
      descriptionOfWorkToBeDone: map['descriptionOfWorkToBeDone'],
      location: map['location'],
      date: (map['date'] as Timestamp).toDate(),
      workingType: List<String>.from(map['workingType'] ?? []),
      workToDo: map['workToDo'],
      danger: map['danger'],
      precautionsToTake: map['precautionsToTake'],
      ppeToBeUsed: List<String>.from(map['ppeToBeUsed'] ?? []),
      nameSurnameOfGrantor: map['nameSurnameOfGrantor'],
      dateOfGrantor: (map['dateOfGrantor'] as Timestamp).toDate(),
    );
  }
}
