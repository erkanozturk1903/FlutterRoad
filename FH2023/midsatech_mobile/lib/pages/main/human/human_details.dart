// ignore_for_file: prefer_const_constructors, prefer_interpolation_to_compose_strings, unnecessary_string_interpolations, unnecessary_string_interpolations

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:midsatech_mobile/pages/main/human/model/human_model.dart';

class HumanDetails extends StatefulWidget {
  final Human human;

  HumanDetails({required this.human});

  @override
  State<HumanDetails> createState() => _HumanDetailsState();
}

class _HumanDetailsState extends State<HumanDetails> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nameController;
  late TextEditingController _surnameController;
  late TextEditingController _departmentController;
  late TextEditingController _genderController;
  late TextEditingController _birthDateController;
  late TextEditingController _emailController;
  late TextEditingController _phoneController;
  late TextEditingController _addressController;
  late TextEditingController _bloodTypeController;
  late TextEditingController _educationController;
  late TextEditingController _maritalStatusController;
  late TextEditingController _jobsController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _nameController = TextEditingController(text: widget.human.name);
    _surnameController = TextEditingController(text: widget.human.surname);
    _departmentController =
        TextEditingController(text: widget.human.department);
    _genderController = TextEditingController(text: widget.human.gender);
    _birthDateController = TextEditingController(text: widget.human.birthDate);
    _emailController = TextEditingController(text: widget.human.email);
    _phoneController = TextEditingController(text: widget.human.phoneNumber);
    _addressController = TextEditingController(text: widget.human.address);
    _bloodTypeController = TextEditingController(text: widget.human.bloodType);
    _educationController = TextEditingController(text: widget.human.education);
    _maritalStatusController =
        TextEditingController(text: widget.human.maritalStatus);
    _jobsController = TextEditingController(text: widget.human.jobs);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _nameController.dispose();
    _surnameController.dispose();
    _departmentController.dispose();
    _genderController.dispose();
    _birthDateController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _addressController.dispose();
    _bloodTypeController.dispose();
    _educationController.dispose();
    _maritalStatusController.dispose();
    _jobsController.dispose();
  }

  Future<void> _updateHuman() async {
    if (_formKey.currentState!.validate()) {
      Human human = Human(
        id: widget.human.id,
        name: _nameController.text,
        surname: _surnameController.text,
        department: _departmentController.text,
        gender: _genderController.text,
        birthDate: _birthDateController.text,
        email: _emailController.text,
        phoneNumber: _phoneController.text,
        address: _addressController.text,
        bloodType: _bloodTypeController.text,
        education: _educationController.text,
        maritalStatus: _maritalStatusController.text,
        jobs: _jobsController.text,
        birthPlace: widget.human.birthPlace,
        profilResmiUrl: widget.human.profilResmiUrl,
      );
      await FirebaseFirestore.instance
          .collection('midsatech')
          .doc('customers')
          .collection('administrator')
          .doc('personel');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.human.name + " " + widget.human.surname),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("name".tr + ":" + "${widget.human.name}",
                style: TextStyle(fontSize: 18)),
            Text("surname".tr + ":" + "${widget.human.surname}",
                style: TextStyle(fontSize: 18)),
            Text("department".tr + ":" + "${widget.human.department}",
                style: TextStyle(fontSize: 18)),
            Text("gender".tr + ":" + "${widget.human.gender}",
                style: TextStyle(fontSize: 18)),
            Text("birth_date".tr + ":" + "${widget.human.birthDate}",
                style: TextStyle(fontSize: 18)),
            Text("email".tr + ":" + "${widget.human.email}",
                style: TextStyle(fontSize: 18)),
            Text("phone".tr + ":" + "${widget.human.birthPlace}",
                style: TextStyle(fontSize: 18)),
            Text("address".tr + ":" + "${widget.human.address}",
                style: TextStyle(fontSize: 18)),
            Text("blood_type".tr + ":" + "${widget.human.bloodType}",
                style: TextStyle(fontSize: 18)),
            Text("height".tr + ":" + "${widget.human.education}",
                style: TextStyle(fontSize: 18)),
            Text("education".tr + ":" + "${widget.human.maritalStatus}",
                style: TextStyle(fontSize: 18)),
            Text("job".tr + ":" + "${widget.human.jobs}",
                style: TextStyle(fontSize: 18)),

            // Buraya düzenleme için bir buton ekleyebilirsiniz.
          ],
        ),
      ),
    );
  }
}
