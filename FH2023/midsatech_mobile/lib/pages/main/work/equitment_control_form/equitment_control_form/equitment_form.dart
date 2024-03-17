import 'package:flutter/material.dart';

class EquitmentControlForm extends StatefulWidget {
  const EquitmentControlForm({super.key});

  @override
  State<EquitmentControlForm> createState() => _EquitmentControlFormState();
}

class _EquitmentControlFormState extends State<EquitmentControlForm> {
  List<InspectionItem> inspectionItems = [
    InspectionItem(
        description:
            "Was the necessary information given to the Occupational Safety Unit regarding the work to be done?"),
    InspectionItem(
        description:
            "Is the Project Coordinator/Technician-Technician in the field where the work is carried out?"),
    InspectionItem(
        description:
            "Is the personnel conducting the work the personnel reported by the company and whose documents have been submitted?"),
    InspectionItem(description: "Is environmental safety taken?"),
    InspectionItem(
        description:
            "Are the necessary safety measures taken according to the work done?"),
    InspectionItem(
        description:
            "Are the working instructions (working at height, manual handling, welding work, etc.) considered related to the work done?"),
    InspectionItem(
        description:
            "Does the personnel within the field comply with Covid-19 precautions?"),
    InspectionItem(
        description:
            "If there is hot work such as open flame source work, has the relevant units (Occupational Safety Unit, Emergency Coordination, Fire Department) been informed?"),
    InspectionItem(
        description:
            "When working in a closed area, are heat/smoke detectors deactivated considering the conditions such as dust, heat, etc. generated?"),
    InspectionItem(
        description:
            "Are the machines, equipment, cables (Welding, electricity, etc.) in the field scattered in a way that could cause falling or equipment damage?"),
    InspectionItem(
        description:
            "Do the used work equipment have protective equipment? Are they in a safe condition?"),
    InspectionItem(
        description:
            "If breaking, drilling, cutting work is being done, is environmental safety considered against dust etc. formation?"),
    InspectionItem(
        description:
            "If chemical use is involved, are measures taken for the spread of the chemical, personal exposure, etc.?"),
    InspectionItem(
        description:
            "If oxy-gas welding is to be done, are the shawl, hose, and cylinders checked? Are they suitable for the work?"),
    InspectionItem(
        description:
            "If electric arc welding is to be done, are the cable assembly and electrical components checked? Are they suitable for the work?"),
    InspectionItem(
        description:
            "If working with electricity, are precautions taken by cutting off energy, grounding, labeling, and locking?"),
    InspectionItem(
        description:
            "If there is work at height, are portable ladders, mobile scaffolds, etc., provided according to the height and standards?"),
    InspectionItem(
        description:
            "If there is work at height, are there suitable anchorage points for safety belts?"),
    InspectionItem(
        description:
            "Is construction machinery being used in the work? If so, does the operator have documents and does the construction machine have periodic control?"),
    InspectionItem(
        description:
            "Are the employees using the Personal Protective Equipment (PPE) provided to them?"),
    InspectionItem(
        description:
            "Do the employees have a lack of Personal Protective Equipment (PPE)?"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('General Checklist'),
      ),
      body: ListView.separated(
        itemCount: inspectionItems.length,
        itemBuilder: (context, index) {
          final item = inspectionItems[index];
          return CheckboxListTile(
            activeColor: Colors.deepOrange,

            checkColor: Colors.white,
            title: Text(item.description),
            value: item.isChecked,
            onChanged: (bool? value) {
              setState(() {
                item.isChecked = value;
              });
            },
            tristate: true, // Allows for Yes/No/Out of Scope (null) options
          );
        },
        separatorBuilder: (context, index) => Divider(
          color: Colors.deepOrange, // Divider color
          height: 1, // Space the divider takes vertically
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.save),
        onPressed: () {
          // Here you can handle the form submission logic
          // For example, print the form values or send them to a server
        },
      ),
    );
  }
}

class InspectionItem {
  String description;
  bool? isChecked;

  InspectionItem({required this.description, this.isChecked});
}
