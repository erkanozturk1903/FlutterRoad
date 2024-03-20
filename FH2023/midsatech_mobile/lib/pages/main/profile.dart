import 'dart:io';

import 'package:flutter/material.dart';
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
                child: Text('Change Profile Picture'),
              ),
              SizedBox(height: 20),
              _buildTextFormField('Email'),
              const SizedBox(height: 20),
              _buildTextFormField('Name'),
              const SizedBox(height: 20),
              _buildTextFormField('Address'),
              const SizedBox(height: 20),
              _buildTextFormField('Phone Number'),
              const SizedBox(height: 20),
              _buildTextFormField('Position'),
              const SizedBox(height: 20),
              _buildTextFormField('Profession'),
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
                  'Save Profile',
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
