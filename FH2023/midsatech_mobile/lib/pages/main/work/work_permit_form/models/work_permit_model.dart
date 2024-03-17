//import 'package:cloud_firestore/cloud_firestore.dart';

class WorkPermitFormData {
  String? descriptionOfWork;
  String? location;
  //Timestamp? date;
  List<String>? workingType;
  String? workToDo;
  String? danger;
  String? precautionsToTake;
  List<String>? ppeToBeUsed;
  String? nameSurnamePermitGrantor;
  //Timestamp? datePermitGrantor;

  WorkPermitFormData({
    this.descriptionOfWork,
    this.location,
    //this.date,
    this.workingType,
    this.workToDo,
    this.danger,
    this.precautionsToTake,
    this.ppeToBeUsed,
    this.nameSurnamePermitGrantor,
    //this.datePermitGrantor,
  });

  Map<String, dynamic> toMap() {
    return {
      'descriptionOfWork': descriptionOfWork,
      'location': location,
      //'date': date,
      'workingType': workingType,
      'workToDo': workToDo,
      'danger': danger,
      'precautionsToTake': precautionsToTake,
      'ppeToBeUsed': ppeToBeUsed,
      'nameSurnamePermitGrantor': nameSurnamePermitGrantor,
      //'datePermitGrantor': datePermitGrantor,
    };
  }

  factory WorkPermitFormData.fromMap(Map<String, dynamic> map) {
    return WorkPermitFormData(
      descriptionOfWork: map['descriptionOfWork'],
      location: map['location'],
      //date: map['date'],
      workingType: List<String>.from(map['workingType']),
      workToDo: map['workToDo'],
      danger: map['danger'],
      precautionsToTake: map['precautionsToTake'],
      ppeToBeUsed: List<String>.from(map['ppeToBeUsed']),
      nameSurnamePermitGrantor: map['nameSurnamePermitGrantor'],
      //datePermitGrantor: map['datePermitGrantor'],
    );
  }
}
