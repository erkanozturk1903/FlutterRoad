import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final ImagePicker _picker = ImagePicker();
  XFile? _profileImage;
  final _formKey = GlobalKey<FormState>();

  List<String> specialties = [
    'Data Analysis',
    'Cyber Security',
    'Software Development',
    'Project Management',
    // Diğer uzmanlık alanları
  ];

  Future<void> _pickImage() async {
    final pickedImage = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _profileImage = pickedImage;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              CircleAvatar(
                backgroundColor: Colors.deepOrange[200],
                radius: 60,
                backgroundImage: _profileImage != null
                    ? FileImage(File(_profileImage!.path))
                    : null,
                child: _profileImage == null
                    ? Icon(
                        Icons.person,
                        size: 60,
                        color: Colors.white,
                      )
                    : null,
              ),
              TextButton(
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.deepOrange,
                  disabledForegroundColor: Colors.grey.withOpacity(0.38),
                ),
                onPressed: _pickImage,
                child: Text('change_profile_picture'.tr),
              ),
              SizedBox(height: 20),
              _buildTextFormField('email'.tr),
              const SizedBox(height: 20),
              _buildTextFormField('name'.tr),
              const SizedBox(height: 20),
              _buildTextFormField('address'.tr),
              const SizedBox(height: 20),
              _buildTextFormField('phone_number'.tr),
              const SizedBox(height: 20),
              _buildTextFormField('position'.tr),
              const SizedBox(height: 20),
              _buildTextFormField('profession'.tr),
              const SizedBox(height: 20),
              // DropdownButtonFormField ve Kaydet butonu...
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepOrange,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                ),
                onPressed: () {
                  // Profil güncelleme işlemleri...
                },
                child: Text(
                  'save_profile'.tr,
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextFormField(String label) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        filled: true,
        fillColor: Colors.grey[200],
      ),
      onSaved: (value) {
        // Değerleri kaydetme işlemi...
      },
    );
  }
}
