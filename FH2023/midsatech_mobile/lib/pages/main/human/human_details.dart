// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
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
            Text("Name: ${human.name}", style: TextStyle(fontSize: 18)),
            Text("Surname: ${human.surname}", style: TextStyle(fontSize: 18)),
            Text("Department: ${human.department}",
                style: TextStyle(fontSize: 18)),
            Text("Gender: ${human.gender}", style: TextStyle(fontSize: 18)),
            Text("Birth Date: ${human.birthDate}",
                style: TextStyle(fontSize: 18)),
            Text("Email: ${human.email}", style: TextStyle(fontSize: 18)),
            Text("Phone: ${human.birthPlace}", style: TextStyle(fontSize: 18)),
            Text("Address: ${human.address}", style: TextStyle(fontSize: 18)),
            Text("Blood Type: ${human.bloodType}",
                style: TextStyle(fontSize: 18)),
            Text("Height: ${human.education}", style: TextStyle(fontSize: 18)),
            Text("Education: ${human.maritalStatus}",
                style: TextStyle(fontSize: 18)),
            Text("Job: ${human.jobs}", style: TextStyle(fontSize: 18)),

            // Buraya düzenleme için bir buton ekleyebilirsiniz.
          ],
        ),
      ),
    );
  }
}
