/*
import 'package:cloud_firestore/cloud_firestore.dart';

class FieldSurveillanceReport {
  final String id;
  final String detecting;
  final String preparedBy;
  final String reportNumber;
  final DateTime date;
  final String definitionNonconformity;
  final String reasonNonconformity;
  final String addressUnit;
  final String responsibleUnit;
  final List<String> images;
  final int selectedOlasilik;
  final int selectedSiddet;
  final int sonuc;
  final String opinionUnitResponsible;

  FieldSurveillanceReport({
    this.id = '',
    required this.detecting,
    required this.preparedBy,
    required this.reportNumber,
    required this.date,
    required this.definitionNonconformity,
    required this.reasonNonconformity,
    required this.addressUnit,
    required this.responsibleUnit,
    required this.images,
    required this.selectedOlasilik,
    required this.selectedSiddet,
    required this.sonuc,
    required this.opinionUnitResponsible,
  });

  factory FieldSurveillanceReport.fromSnapshot(DocumentSnapshot snapshot) {
    Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;

    return FieldSurveillanceReport(
      id: snapshot.id,
      detecting: data['detecting'] ?? '',
      preparedBy: data['preparedBy'] ?? '',
      reportNumber: data['reportNumber'] ?? '',
      date: (data['date'] as Timestamp).toDate(),
      definitionNonconformity: data['definitionNonconformity'] ?? '',
      reasonNonconformity: data['reasonNonconformity'] ?? '',
      addressUnit: data['addressUnit'] ?? '',
      responsibleUnit: data['responsibleUnit'] ?? '',
      images: List<String>.from(data['images'] ?? []),
      selectedOlasilik: data['selectedOlasilik'] ?? 0,
      selectedSiddet: data['selectedSiddet'] ?? 0,
      sonuc: data['sonuc'] ?? 0,
      opinionUnitResponsible: data['opinionUnitResponsible'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'detecting': detecting,
      'preparedBy': preparedBy,
      'reportNumber': reportNumber,
      'date': Timestamp.fromDate(date),
      'definitionNonconformity': definitionNonconformity,
      'reasonNonconformity': reasonNonconformity,
      'addressUnit': addressUnit,
      'responsibleUnit': responsibleUnit,
      'images': images,
      'selectedOlasilik': selectedOlasilik,
      'selectedSiddet': selectedSiddet,
      'sonuc': sonuc,
      'opinionUnitResponsible': opinionUnitResponsible,
    };
  }
}
*/