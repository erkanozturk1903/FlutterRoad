class NearMissFormData {
  String? businessName;
  String? location;
  // Timestamp? date;
  String? nameSurname;
  String? mission;
  String? unitOfWork;
  String? phoneNumber;
  String? emailAddress;
  String? description;
  String? solution;
  List<String>? imageUrls;
  bool nearMissIncident = false;
  bool dangerousSituation = false;
  String? opinionUnitResponsible;

  NearMissFormData({
    this.businessName,
    this.location,
    //this.date,
    this.nameSurname,
    this.mission,
    this.unitOfWork,
    this.phoneNumber,
    this.emailAddress,
    this.description,
    this.solution,
    this.imageUrls,
    this.nearMissIncident = false,
    this.dangerousSituation = false,
    this.opinionUnitResponsible,
  });

  Map<String, dynamic> toMap() {
    return {
      'businessName': businessName,
      'location': location,
      //'date': date,
      'nameSurname': nameSurname,
      'mission': mission,
      'unitOfWork': unitOfWork,
      'phoneNumber': phoneNumber,
      'emailAddress': emailAddress,
      'description': description,
      'solution': solution,
      'imageUrls': imageUrls,
      'nearMissIncident': nearMissIncident,
      'dangerousSituation': dangerousSituation,
      'opinionUnitResponsible': opinionUnitResponsible,
    };
  }

  factory NearMissFormData.fromMap(Map<String, dynamic> map) {
    return NearMissFormData(
      businessName: map['businessName'],
      location: map['location'],
      //date: map['date'],
      nameSurname: map['nameSurname'],
      mission: map['mission'],
      unitOfWork: map['unitOfWork'],
      phoneNumber: map['phoneNumber'],
      emailAddress: map['emailAddress'],
      description: map['description'],
      solution: map['solution'],
      imageUrls: List<String>.from(map['imageUrls']),
      nearMissIncident: map['nearMissIncident'],
      dangerousSituation: map['dangerousSituation'],
      opinionUnitResponsible: map['opinionUnitResponsible'],
    );
  }
}
