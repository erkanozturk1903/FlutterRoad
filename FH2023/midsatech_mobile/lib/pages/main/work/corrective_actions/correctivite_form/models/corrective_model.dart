class CorrectiviteFormData {
  String businessName = '';
  String cpaNumber = '';
  DateTime? date;
  List<String> demandWhy = [];

  String nameSurname = '';
  String mission = '';
  String unitOfWork = '';

  String definitionOfNonconformity = '';
  String possibleRisks = '';
  String rootCause = '';
  String adviceAndSuggestions = '';
  List<String> imagePaths = [];

  String activitiesPerformed = '';
  List<String> cpaResult = [];
  DateTime? dateResult;

  String approvedName = '';

  CorrectiviteFormData({
    required this.businessName,
    required this.cpaNumber,
    required this.date,
    required this.demandWhy,
    required this.nameSurname,
    required this.mission,
    required this.unitOfWork,
    required this.definitionOfNonconformity,
    required this.possibleRisks,
    required this.rootCause,
    required this.adviceAndSuggestions,
    required this.imagePaths,
    required this.activitiesPerformed,
    required this.cpaResult,
    required this.dateResult,
    required this.approvedName,
  });

  Map<String, dynamic> toJson() {
    return {
      'businessName': businessName,
      'cpaNumber': cpaNumber,
      'date': date?.toIso8601String(),
      'demandWhy': demandWhy,
      'nameSurname': nameSurname,
      'mission': mission,
      'unitOfWork': unitOfWork,
      'definitionOfNonconformity': definitionOfNonconformity,
      'possibleRisks': possibleRisks,
      'rootCause': rootCause,
      'adviceAndSuggestions': adviceAndSuggestions,
      'imagePaths': imagePaths,
      'activitiesPerformed': activitiesPerformed,
      'cpaResult': cpaResult,
      'dateResult': dateResult?.toIso8601String(),
      'approvedName': approvedName,
    };
  }

  factory CorrectiviteFormData.fromJson(Map<String, dynamic> json) {
    return CorrectiviteFormData(
      businessName: json['businessName'] ?? '',
      cpaNumber: json['cpaNumber'] ?? '',
      date: json['date'] != null ? DateTime.parse(json['date']) : null,
      demandWhy: List<String>.from(json['demandWhy'] ?? []),
      nameSurname: json['nameSurname'] ?? '',
      mission: json['mission'] ?? '',
      unitOfWork: json['unitOfWork'] ?? '',
      definitionOfNonconformity: json['definitionOfNonconformity'] ?? '',
      possibleRisks: json['possibleRisks'] ?? '',
      rootCause: json['rootCause'] ?? '',
      adviceAndSuggestions: json['adviceAndSuggestions'] ?? '',
      imagePaths: List<String>.from(json['imagePaths'] ?? []),
      activitiesPerformed: json['activitiesPerformed'] ?? '',
      cpaResult: List<String>.from(json['cpaResult'] ?? []),
      dateResult: json['dateResult'] != null
          ? DateTime.parse(json['dateResult'])
          : null,
      approvedName: json['approvedName'] ?? '',
    );
  }
}
