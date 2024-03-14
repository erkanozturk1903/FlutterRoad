class Task {
  String? taskName;
  String? taskLocation;
  String? taskHour;
  DateTime taskDate;
  String? taskDescription;

  Task({
    this.taskName,
    this.taskLocation,
    this.taskHour,
    required this.taskDate,
    this.taskDescription,
  });
}
