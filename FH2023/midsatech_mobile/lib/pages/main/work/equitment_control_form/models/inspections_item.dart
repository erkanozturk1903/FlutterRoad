// inspection_item.dart
class InspectionItem {
  String description;
  bool? isChecked;

  InspectionItem({required this.description, this.isChecked});

  factory InspectionItem.fromJson(Map<String, dynamic> json) {
    return InspectionItem(
      description: json['description'],
      isChecked: json['isChecked'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'description': description,
      'isChecked': isChecked,
    };
  }
}
