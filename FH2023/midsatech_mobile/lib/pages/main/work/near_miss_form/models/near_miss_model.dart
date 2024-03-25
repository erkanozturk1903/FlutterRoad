import 'package:cloud_firestore/cloud_firestore.dart';

class NearMissFormData {
  final String businessName;
  final String location;
  final DateTime date;
  final String adi;
  final String mission;
  final String unit;
  final String phone;
  final String email;
  final String description;
  final String solution;
  final bool nearMissIncident;
  final bool dangerousSituation;
  final String opinionUnitResponsible;
  final List<String> imageUrls;

  NearMissFormData({
    required this.businessName,
    required this.location,
    required this.date,
    required this.adi,
    required this.mission,
    required this.unit,
    required this.phone,
    required this.email,
    required this.description,
    required this.solution,
    required this.nearMissIncident,
    required this.dangerousSituation,
    required this.opinionUnitResponsible,
    required this.imageUrls,
  });

  Map<String, dynamic> toMap() {
    return {
      'business_name': businessName,
      'location': location,
      'date': date,
      'adi': adi,
      'mission': mission,
      'unit': unit,
      'phone': phone,
      'email': email,
      'description': description,
      'solution': solution,
      'near_miss_incident': nearMissIncident,
      'dangerous_situation': dangerousSituation,
      'opinion_unit_responsible': opinionUnitResponsible,
      'image_urls': imageUrls,
    };
  }

  factory NearMissFormData.fromMap(Map<String, dynamic> map) {
    return NearMissFormData(
      businessName: map['business_name'],
      location: map['location'],
      date: (map['date'] as Timestamp).toDate(),
      adi: map['adi'],
      mission: map['mission'],
      unit: map['unit'],
      phone: map['phone'],
      email: map['email'],
      description: map['description'],
      solution: map['solution'],
      nearMissIncident: map['near_miss_incident'],
      dangerousSituation: map['dangerous_situation'],
      opinionUnitResponsible: map['opinion_unit_responsible'],
      imageUrls: List<String>.from(map['image_urls']),
    );
  }
}
