class IsKazasi {
  IsyeriBilgileri isyeriBilgileri;
  KazaOlayBilgileri kazaOlayBilgileri;
  KazazedeBilgileri kazazedeBilgileri;
  KazaOlayArastirmasi kazaOlayArastirmasi;
  Sonuclar sonuclar;
  ArastirmaEkibi arastirmaEkibi;

  IsKazasi({
    required this.isyeriBilgileri,
    required this.kazaOlayBilgileri,
    required this.kazazedeBilgileri,
    required this.kazaOlayArastirmasi,
    required this.sonuclar,
    required this.arastirmaEkibi,
  });
}

class IsyeriBilgileri {
  String isverenTuru;
  String isYeriAdi;
  String digerIsYeriAdi;

  IsyeriBilgileri({
    required this.isverenTuru,
    required this.isYeriAdi,
    required this.digerIsYeriAdi,
  });
}

class KazaOlayBilgileri {
  String kazaNo;
  DateTime tarih;
  String kazaYeri;
  String saat;
  String faaliyet;
  String vardiya;

  KazaOlayBilgileri({
    required this.kazaNo,
    required this.tarih,
    required this.kazaYeri,
    required this.saat,
    required this.faaliyet,
    required this.vardiya,
  });
}

class KazazedeBilgileri {
  String adiSoyadi;
  String sicilNo;
  String birimi;
  String tcKimlikNo;
  DateTime iseGirisTarihi;
  DateTime dogumTarihi;

  KazazedeBilgileri({
    required this.adiSoyadi,
    required this.sicilNo,
    required this.birimi,
    required this.tcKimlikNo,
    required this.iseGirisTarihi,
    required this.dogumTarihi,
  });
}

class KazaOlayArastirmasi {
  String kazaOlayTarifi;
  List<String> kazaOlayTuru;
  List<String> etkilenenBolge;
  Map<String, bool> kazaninNedeni;

  KazaOlayArastirmasi({
    required this.kazaOlayTarifi,
    required this.kazaOlayTuru,
    required this.etkilenenBolge,
    required this.kazaninNedeni,
  });
}

class Sonuclar {
  List<String> kazaOlaySonucu;
  String raporGunSayisi;
  String hastaneAdi;
  List<String> kazaSonrasiYapilanIslemler;

  Sonuclar({
    required this.kazaOlaySonucu,
    required this.raporGunSayisi,
    required this.hastaneAdi,
    required this.kazaSonrasiYapilanIslemler,
  });
}

class ArastirmaEkibi {
  String adiSoyadi;
  String gorevi;
  DateTime tarih;
  String imza;

  ArastirmaEkibi({
    required this.adiSoyadi,
    required this.gorevi,
    required this.tarih,
    required this.imza,
  });
}

/*
import 'package:flutter/material.dart';

class IsKazasiModel {
  final String? employerType;
  final String? businessName;
  final String? accidentNumber;
  final String? accidentLocation;
  final DateTime? accidentDate;
  final TimeOfDay? accidentTime;
  final String? activity;
  final String? shift;
  final String? nameSurname;
  final String? departmentWorkInformation;
  final String? identificationNumber;
  final DateTime? startDateOfWork;
  final DateTime? dateOfBirth;
  final String? postAccidentProcedures;
  final List<String>? accidentIncidentType;
  final List<String>? affectedArea;
  final List<String>? accidentCauseEmployed;
  final List<String>? accidentCauseEquipment;
  final List<String>? workingEnvironment;
  final String? accidentResultReport;
  final String? numberOfReportDays;
  final String? hospitalName;
  final List<String>? accidentResult;
  final String? nonconformitiesCausedAccident;
  final String? correctivePreventiveActions;
  final String? investigatingNameSurname;
  final String? position;
  final DateTime? investigationDate;
  final String? signature;

  IsKazasiModel({
    this.employerType,
    this.businessName,
    this.accidentNumber,
    this.accidentLocation,
    this.accidentDate,
    this.accidentTime,
    this.activity,
    this.shift,
    this.nameSurname,
    this.departmentWorkInformation,
    this.identificationNumber,
    this.startDateOfWork,
    this.dateOfBirth,
    this.postAccidentProcedures,
    this.accidentIncidentType,
    this.affectedArea,
    this.accidentCauseEmployed,
    this.accidentCauseEquipment,
    this.workingEnvironment,
    this.accidentResultReport,
    this.numberOfReportDays,
    this.hospitalName,
    this.accidentResult,
    this.nonconformitiesCausedAccident,
    this.correctivePreventiveActions,
    this.investigatingNameSurname,
    this.position,
    this.investigationDate,
    this.signature,
  });
}
*/