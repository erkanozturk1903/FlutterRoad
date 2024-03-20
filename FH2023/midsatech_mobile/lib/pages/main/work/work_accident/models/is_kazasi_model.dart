import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class IsKazasiModel {
  final String businessName;
  final String accidentNumber;
  final String accidentLocation;
  final DateTime accidentDate;
  final TimeOfDay accidentTime;
  final String activity;
  final String shift;
  final String nameSurname;
  final String departmentWorkInformation;
  final String identificationNumber;
  final DateTime startDateOfWork;
  final DateTime dateOfBirth;
  final String postAccidentProcedures;
  final List<String> accidentIncidentType;
  final List<String> affectedArea;
  final List<String> accidentCauseEmployed;
  final List<String> accidentCauseEquipment;
  final List<String> workingEnvironment;
  final String accidentResultReport;
  final String numberOfReportDays;
  final String hospitalName;
  final List<String> accidentResult;
  final String nonconformitiesCausedAccident;
  final String correctivePreventiveActions;
  final String investingNameSurname;
  final String position;
  final DateTime date;
  final String signature;

  IsKazasiModel({
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
    required this.accidentIncidentType,
    required this.affectedArea,
    required this.accidentCauseEmployed,
    required this.accidentCauseEquipment,
    required this.workingEnvironment,
    required this.accidentResultReport,
    required this.numberOfReportDays,
    required this.hospitalName,
    required this.accidentResult,
    required this.nonconformitiesCausedAccident,
    required this.correctivePreventiveActions,
    required this.investingNameSurname,
    required this.position,
    required this.date,
    required this.signature,
  });

  // Firestore'a kaydetmek için map dönüşümü
  Map<String, dynamic> toMap() {
    return {
      'businessName': businessName,
      'accidentNumber': accidentNumber,
      'accidentLocation': accidentLocation,
      'accidentDate': Timestamp.fromDate(accidentDate),
      'accidentTime': TimeOfDayToDateTime(accidentTime),
      'activity': activity,
      'shift': shift,
      'nameSurname': nameSurname,
      'departmentWorkInformation': departmentWorkInformation,
      'identificationNumber': identificationNumber,
      'startDateOfWork': Timestamp.fromDate(startDateOfWork),
      'dateOfBirth': Timestamp.fromDate(dateOfBirth),
      'postAccidentProcedures': postAccidentProcedures,
      'accidentIncidentType': accidentIncidentType,
      'affectedArea': affectedArea,
      'accidentCauseEmployed': accidentCauseEmployed,
      'accidentCauseEquipment': accidentCauseEquipment,
      'workingEnvironment': workingEnvironment,
      'accidentResultReport': accidentResultReport,
      'numberOfReportDays': numberOfReportDays,
      'hospitalName': hospitalName,
      'accidentResult': accidentResult,
      'nonconformitiesCausedAccident': nonconformitiesCausedAccident,
      'correctivePreventiveActions': correctivePreventiveActions,
      'investingNameSurname': investingNameSurname,
      'position': position,
      'date': Timestamp.fromDate(date),
      'signature': signature,
    };
  }

  // TimeOfDay'ı DateTime'a dönüştürme
  DateTime TimeOfDayToDateTime(TimeOfDay timeOfDay) {
    final now = DateTime.now();
    return DateTime(
        now.year, now.month, now.day, timeOfDay.hour, timeOfDay.minute);
  }
}

class IsKazasiService {
  final CollectionReference isKazasiCollection = FirebaseFirestore.instance
      .collection('midsatech')
      .doc('customers')
      .collection('users')
      .doc('safety')
      .collection('is_kazasi');

  Future<void> saveIsKazasi(IsKazasiModel isKazasi) async {
    try {
      await isKazasiCollection.add(isKazasi.toMap());
      print('İş Kazası Formu Başarıyla Kaydedildi.');
    } catch (e) {
      print('İş Kazası Formu Kaydedilirken Hata Oluştu: $e');
    }
  }
}
