// ignore_for_file: unused_import

import 'package:cloud_firestore/cloud_firestore.dart';

class Human {
  final String id;
  final String name;
  final String surname;
  final String department;
  final String gender;
  final String email;
  final String phoneNumber;
  final String address;
  final String birthDate;
  final String birthPlace;
  final String education;
  final String bloodType;
  final String maritalStatus;
  final String jobs;
  final String profilResmiUrl;

  Human({
    required this.id,
    required this.name,
    required this.surname,
    required this.department,
    required this.gender,
    required this.email,
    required this.phoneNumber,
    required this.address,
    required this.birthDate,
    required this.birthPlace,
    required this.education,
    required this.bloodType,
    required this.maritalStatus,
    required this.jobs,
    required this.profilResmiUrl,
  });

  // Firebase uyumlu veri yapısına dönüştürme metodu
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'surname': surname,
      'department': department,
      'gender': gender,
      'email': email,
      'phoneNumber': phoneNumber,
      'address': address,
      'birthDate': birthDate,
      'birthPlace': birthPlace,
      'education': education,
      'bloodType': bloodType,
      'maritalStatus': maritalStatus,
      'jobs': jobs,
      'profilResmiUrl': profilResmiUrl,
    };
  }

  // Firebase'den gelen veriyi Human nesnesine dönüştürme metodu
  factory Human.fromMap(Map<String, dynamic>? map) {
    return Human(
      id: map?['id'] ?? '',
      name: map?['name'] ?? '',
      surname: map?['surname'] ?? '',
      department: map?['department'] ?? '',
      gender: map?['gender'] ?? '',
      email: map?['email'] ?? '',
      phoneNumber: map?['phoneNumber'] ?? '',
      address: map?['address'] ?? '',
      birthDate: map?['birthDate'] ?? '',
      birthPlace: map?['birthPlace'] ?? '',
      education: map?['education'] ?? '',
      bloodType: map?['bloodType'] ?? '',
      maritalStatus: map?['maritalStatus'] ?? '',
      jobs: map?['jobs'] ?? '',
      profilResmiUrl: map?['profilResmiUrl'] ?? '',
    );
  }
}
