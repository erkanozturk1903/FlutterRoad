class AdminUser {
  String id;
  String username;
  String email;
  String
      password; // Gerçek uygulamalarda şifreler açık metin olarak saklanmamalıdır
  List<String> roles;
  String profilePictureUrl;
  String address;
  String phoneNumber;
  String position; // Görev
  String profession; // Meslek
  List<String> specialties; // Uzmanlık alanları

  AdminUser({
    required this.id,
    required this.username,
    required this.email,
    required this.password,
    required this.roles,
    required this.profilePictureUrl,
    required this.address,
    required this.phoneNumber,
    required this.position,
    required this.profession,
    required this.specialties,
  });

  // Veritabanından bir dökümanı AdminUser nesnesine dönüştüren factory constructor
  factory AdminUser.fromJson(Map<String, dynamic> json) => AdminUser(
        id: json['id'],
        username: json['username'],
        email: json['email'],
        password: json[
            'password'], // Şifrelerin güvenli bir şekilde saklandığından emin olun
        roles: List<String>.from(json['roles']),
        profilePictureUrl: json['profilePictureUrl'],
        address: json['address'],
        phoneNumber: json['phoneNumber'],
        position: json['position'],
        profession: json['profession'],
        specialties: List<String>.from(json['specialties']),
      );

  // AdminUser nesnesini JSON'a dönüştüren metod
  Map<String, dynamic> toJson() => {
        'id': id,
        'username': username,
        'email': email,
        'password': password, // Şifreleri açık metin olarak saklamaktan kaçının
        'roles': roles,
        'profilePictureUrl': profilePictureUrl,
        'address': address,
        'phoneNumber': phoneNumber,
        'position': position,
        'profession': profession,
        'specialties': specialties,
      };
}

List<String> roles = [
  'superAdmin', // Sistem genelinde tüm yetkilere sahip
  'contentManager', // İçerik yönetimi yetkilerine sahip (makale, haber vb. içerikleri yönetebilir)
  'userAdmin', // Kullanıcı yönetimi yetkilerine sahip (kullanıcı hesaplarını oluşturma, silme, düzenleme vb.)
  'financeManager', // Finans ve faturalandırma işlemlerini yönetebilir
  'marketingSpecialist', // Pazarlama ve reklam kampanyalarını yönetebilir
];

List<String> specialties = [
  'occupationalHealthAndSafety', // İş Sağlığı ve Güvenliği
  'environmentalEngineering', // Çevre Mühendisliği
  'mechanicalEngineering', // Makine Mühendisliği
  'electricalEngineering', // Elektrik Mühendisliği
  'civilEngineering', // İnşaat Mühendisliği
  'chemicalEngineering', // Kimya Mühendisliği
  'industrialEngineering', // Endüstri Mühendisliği
  'riskAssessment', // Risk Değerlendirme
  'emergencyResponsePlanning', // Acil Durum Yanıt Planlama
  'ergonomics', // Ergonomi
  'fireSafety', // Yangın Güvenliği
  'workplaceSafetyInspections', // İş Yeri Güvenlik Denetimleri
  'safetyTrainingAndEducation', // Güvenlik Eğitimi ve Eğitimi
];
