class Item {
  final String name;

  bool isDone;
  Item({
    required this.name,
    this.isDone = false,
  });

  void toggleStatus() {
    isDone = !isDone;
  }

  Item.fromMap(Map<String, dynamic> map)
      : name = map['name'],
        isDone = map['isDone'];
  Map<String, dynamic> toMap() => {'name': name, 'isDone': isDone};
}
