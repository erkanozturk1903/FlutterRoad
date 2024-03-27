// ignore_for_file: unused_local_variable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
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
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _buildInfoTile("Name", widget.human.name),
              _buildInfoTile("Surname", widget.human.surname),
              _buildInfoTile("Department", widget.human.department),
              _buildInfoTile("Gender", widget.human.gender),
              _buildInfoTile("Birth Date", widget.human.birthDate),
              _buildInfoTile("Email", widget.human.email),
              _buildInfoTile("Phone", widget.human.phoneNumber),
              _buildInfoTile("Address", widget.human.address),
              _buildInfoTile("Blood Type", widget.human.bloodType),
              _buildInfoTile("Education", widget.human.education),
              _buildInfoTile("Marital Status", widget.human.maritalStatus),
              _buildInfoTile("Job", widget.human.jobs),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoTile(String title, String subtitle) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(fontSize: 18),
      ),
      subtitle: Text(
        subtitle,
        style: TextStyle(fontSize: 18),
      ),
    );
  }
}
