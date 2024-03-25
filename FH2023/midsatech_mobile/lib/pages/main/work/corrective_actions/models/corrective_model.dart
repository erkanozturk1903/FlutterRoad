import 'package:image_picker/image_picker.dart';

class CorrectiveAction {
  String businessName;
  String cpaNumber;
  DateTime date;
  List<String> demandWhy;
  String nameSurname;
  String mission;
  String unitOfWork;
  String nonconformityDefinition;
  String possibleRisks;
  String rootCause;
  String adviceSuggestions;
  String activitiesPerformed;
  List<String> cpaResult;
  DateTime dateResult;
  List<String>? photoUrls;
  String approvedName;

  CorrectiveAction({
    required this.businessName,
    required this.cpaNumber,
    required this.date,
    required this.demandWhy,
    required this.nameSurname,
    required this.mission,
    required this.unitOfWork,
    required this.nonconformityDefinition,
    required this.possibleRisks,
    required this.rootCause,
    required this.adviceSuggestions,
    required this.activitiesPerformed,
    required this.cpaResult,
    required this.dateResult,
    this.photoUrls,
    required this.approvedName,
  });

  Map<String, dynamic> toMap() {
    return {
      'businessName': businessName,
      'cpaNumber': cpaNumber,
      'date': date.toIso8601String(),
      'demandWhy': demandWhy,
      'nameSurname': nameSurname,
      'mission': mission,
      'unitOfWork': unitOfWork,
      'nonconformityDefinition': nonconformityDefinition,
      'possibleRisks': possibleRisks,
      'rootCause': rootCause,
      'adviceSuggestions': adviceSuggestions,
      'activitiesPerformed': activitiesPerformed,
      'cpaResult': cpaResult,
      'dateResult': dateResult.toIso8601String(),
      'photoUrls': photoUrls,
      'approvedName': approvedName,
    };
  }

  factory CorrectiveAction.fromForm(
      Map<String, dynamic> map, List<XFile>? imageFileList) {
    return CorrectiveAction(
      businessName: map['businessName'] as String? ?? '',
      cpaNumber: map['cpaNumber'] as String? ?? '',
      date: map['date'] is String
          ? DateTime.parse(map['date'] as String)
          : map['date'] is DateTime
              ? map['date'] as DateTime
              : DateTime.now(),
      demandWhy: List<String>.from(map['demandWhy'] ?? []),
      nameSurname: map['nameSurname'] as String? ?? '',
      mission: map['mission'] as String? ?? '',
      unitOfWork: map['unitOfWork'] as String? ?? '',
      nonconformityDefinition: map['nonconformityDefinition'] as String? ?? '',
      possibleRisks: map['possibleRisks'] as String? ?? '',
      rootCause: map['rootCause'] as String? ?? '',
      adviceSuggestions: map['adviceSuggestions'] as String? ?? '',
      activitiesPerformed: map['activitiesPerformed'] as String? ?? '',
      cpaResult: List<String>.from(map['cpaResult'] ?? []),
      dateResult: map['dateResult'] is String
          ? DateTime.parse(map['dateResult'] as String)
          : map['dateResult'] is DateTime
              ? map['dateResult'] as DateTime
              : DateTime.now(),
      photoUrls: imageFileList?.map((e) => e.path).toList(),
      approvedName: map['approvedName'] as String? ?? '',
    );
  }
}
