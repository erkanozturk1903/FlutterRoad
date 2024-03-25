import 'package:image_picker/image_picker.dart';

class IsKazasiReport {
  final List<String> employerType; // String to accommodate single selection
  final List<String> accidentIncidentType;
  final List<String> affectedArea;
  final List<String> accidentCauseEmployed;
  final List<String> accidentCauseEquipment;
  final List<String> workingEnvironment;
  final List<String> accidentResult; // Assuming multiple options allowed

  final String businessName;
  final String accidentNumber;
  final String accidentLocation;
  final DateTime accidentDate;
  final DateTime accidentTime;
  final String activity;
  final String shift;

  final String nameSurname;
  final String departmentWorkInformation;
  final String identificationNumber;
  final DateTime startDateOfWork;
  final DateTime dateOfBirth;

  final String postAccidentProcedures;

  final List<String>?
      accidentPhotos; // Optional for handling potential absence of images

  final String accidentResultReport;
  final String numberOfReportDays;
  final String hospitalName;

  final String investigatingNameSurname;
  final String position;
  final DateTime date;
  final String signature;

  IsKazasiReport({
    required this.employerType,
    required this.accidentIncidentType,
    required this.affectedArea,
    required this.accidentCauseEmployed,
    required this.accidentCauseEquipment,
    required this.workingEnvironment,
    required this.accidentResult,
    required this.businessName,
    required this.accidentNumber,
    required this.accidentLocation,
    required this.accidentDate,
    required this.accidentTime,
    required this.activity,
    required this.shift,
    required this.nameSurname,
    required this.departmentWorkInformation,
    required this.identificationNumber,
    required this.startDateOfWork,
    required this.dateOfBirth,
    required this.postAccidentProcedures,
    this.accidentPhotos,
    required this.accidentResultReport,
    required this.numberOfReportDays,
    required this.hospitalName,
    required this.investigatingNameSurname,
    required this.position,
    required this.date,
    required this.signature,
  });

  factory IsKazasiReport.fromForm(
      Map<String, dynamic> data, List<XFile>? imageFileList) {
    return IsKazasiReport(
      employerType: List<String>.from(
          data['employer_type'] ?? []), // Null durumu için varsayılan değer
      accidentIncidentType:
          List<String>.from(data['accident_incident_type'] ?? []),
      affectedArea: List<String>.from(data['affected_area'] ?? []),
      accidentCauseEmployed:
          List<String>.from(data['accident_cause_employed'] ?? []),
      accidentCauseEquipment:
          List<String>.from(data['accident_cause_equipment'] ?? []),
      workingEnvironment: List<String>.from(data['working_environment'] ?? []),
      accidentResult: List<String>.from(data['accident_result'] ?? []),
      businessName: data['business_name'] as String? ?? '',
      accidentNumber: data['accident_number'] as String? ?? '',
      accidentLocation: data['accident_location'] as String? ?? '',

      accidentDate: data['accident_date'] is String
          ? DateTime.parse(data['accident_time'] as String)
          : data['accident_time'] is DateTime
              ? data['accident_time'] as DateTime
              : DateTime.now(),

      accidentTime: data['accident_time'] is String
          ? DateTime.parse(data['accident_date'] as String)
          : data['accident_date'] is DateTime
              ? data['accident_date'] as DateTime
              : DateTime.now(),
      activity: data['activity'] as String? ?? '',
      shift: data['shift'] as String? ?? '',
      nameSurname: data['name_surname'] as String? ?? '',
      departmentWorkInformation:
          data['department_work_information'] as String? ?? '',
      identificationNumber: data['identification_number'] as String? ?? '',
      startDateOfWork: data['start_date_of_work'] is String
          ? DateTime.parse(data['start_date_of_work'] as String)
          : data['start_date_of_work'] is DateTime
              ? data['start_date_of_work'] as DateTime
              : DateTime.now(),
      dateOfBirth: data['date_of_birth'] is String
          ? DateTime.parse(data['date_of_birth'] as String)
          : data['date_of_birth'] is DateTime
              ? data['date_of_birth'] as DateTime
              : DateTime.now(),
      postAccidentProcedures: data['post_accident_procedures'] as String? ?? '',
      accidentPhotos: imageFileList?.map((e) => e.path).toList(),
      accidentResultReport: data['accident_result_report'] as String? ?? '',
      numberOfReportDays: data['number_of_report_days'] as String? ?? '',
      hospitalName: data['hospital_name'] as String? ?? '',
      investigatingNameSurname:
          data['investigating_name_surname'] as String? ?? '',
      position: data['position'] as String? ?? '',
      date: data['date'] is String
          ? DateTime.parse(data['date'] as String)
          : data['date'] is DateTime
              ? data['date'] as DateTime
              : DateTime.now(),
      signature: data['signature'] as String? ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'employer_type': employerType,
      'accident_incident_type': accidentIncidentType,
      'affected_area': affectedArea,
      'accident_cause_employed': accidentCauseEmployed,
      'accident_cause_equipment': accidentCauseEquipment,
      'working_environment': workingEnvironment,
      'accident_result': accidentResult,
      'business_name': businessName,
      'accident_number': accidentNumber,
      'accident_location': accidentLocation,
      'accident_date': accidentDate.toIso8601String(),
      'accident_time': accidentTime.toIso8601String(),
      'activity': activity,
      'shift': shift,
      'name_surname': nameSurname,
      'department_work_information': departmentWorkInformation,
      'identification_number': identificationNumber,
      'start_date_of_work': startDateOfWork.toIso8601String(),
      'date_of_birth': dateOfBirth.toIso8601String(),
      'post_accident_procedures': postAccidentProcedures,
      'accident_photos': accidentPhotos,
      'accident_result_report': accidentResultReport,
      'number_of_report_days': numberOfReportDays,
      'hospital_name': hospitalName,
      'investigating_name_surname': investigatingNameSurname,
      'position': position,
      'date': date.toIso8601String(),
      'signature': signature,
    };
  }
}
