class Human {
  String id;
  String name;
  String surname;
  String department;
  String? profilResmiUrl;

  Human({
    required this.id,
    required this.name,
    required this.surname,
    required this.department,
    this.profilResmiUrl
  });
}
