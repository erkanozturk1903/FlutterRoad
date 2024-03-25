// ignore_for_file: prefer_const_constructors, prefer_interpolation_to_compose_strings, unnecessary_string_interpolations, unnecessary_string_interpolations

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:midsatech_mobile/pages/main/human/model/human_model.dart';

class HumanDetails extends StatelessWidget {
  final Human human;

  HumanDetails({required this.human});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(human.name + " " + human.surname),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("name".tr + ":" + "${human.name}", style: TextStyle(fontSize: 18)),
            Text("surname".tr + ":" + "${human.surname}", style: TextStyle(fontSize: 18)),
            Text("department".tr + ":" + "${human.department}",
                style: TextStyle(fontSize: 18)),
            Text("gender".tr + ":" + "${human.gender}", style: TextStyle(fontSize: 18)),
            Text("birth_date".tr + ":" + "${human.birthDate}",
                style: TextStyle(fontSize: 18)),
            Text("email".tr + ":" + "${human.email}", style: TextStyle(fontSize: 18)),
            Text("phone".tr + ":" + "${human.birthPlace}", style: TextStyle(fontSize: 18)),
            Text("address".tr + ":" + "${human.address}", style: TextStyle(fontSize: 18)),
            Text("blood_type".tr + ":" + "${human.bloodType}",
                style: TextStyle(fontSize: 18)),
            Text("height".tr + ":" + "${human.education}", style: TextStyle(fontSize: 18)),
            Text("education".tr + ":" + "${human.maritalStatus}",
                style: TextStyle(fontSize: 18)),
            Text("job".tr + ":" + "${human.jobs}", style: TextStyle(fontSize: 18)),

            // Buraya düzenleme için bir buton ekleyebilirsiniz.
          ],
        ),
      ),
    );
  }
}
