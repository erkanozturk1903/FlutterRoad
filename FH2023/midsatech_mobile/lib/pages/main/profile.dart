// ignore_for_file: prefer_final_fields, unnecessary_null_comparison

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _addressController = TextEditingController();
  TextEditingController _phoneNumberController = TextEditingController();
  TextEditingController _positionController = TextEditingController();
  TextEditingController _professionController = TextEditingController();
  late String _uid;

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

  @override
  void initState() {
    super.initState();
    _loadUserProfile();
  }

  Future<void> _loadUserProfile() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      DocumentSnapshot userData = await FirebaseFirestore.instance
          .collection('midsatech')
          .doc('customers')
          .collection('administrator')
          .doc(user.uid)
          .get();

      if (userData.exists) {
        setState(() {
          _uid = user.uid;
          _nameController.text = userData['name'] ?? '';
          _emailController.text = userData['email'] ?? '';
          _addressController.text = userData['address'] ?? '';
          _phoneNumberController.text = userData['phoneNumber'] ?? '';
          _positionController.text = userData['position'] ?? '';
          _professionController.text = userData['profession'] ?? '';
        });
      }
    }
  }

  Future<void> _updateUserProfile() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null && _formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      await FirebaseFirestore.instance
          .collection('midsatech')
          .doc('customers')
          .collection('administrator')
          .doc(_uid)
          .update({
        'name': _nameController.text,
        'email': _emailController.text,
        'address': _addressController.text,
        'phoneNumber': _phoneNumberController.text,
        'position': _positionController.text,
        'profession': _professionController.text,
      });

      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Profile updated successfully')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  controller: _nameController,
                  decoration: InputDecoration(labelText: 'Name'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(labelText: 'Email'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _addressController,
                  decoration: InputDecoration(labelText: 'Address'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your address';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _phoneNumberController,
                  decoration: InputDecoration(labelText: 'Phone Number'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your phone number';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _positionController,
                  decoration: InputDecoration(labelText: 'Position'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your position';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _professionController,
                  decoration: InputDecoration(labelText: 'Profession'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your profession';
                    }
                    return null;
                  },
                ),
                ElevatedButton(
                  onPressed: _updateUserProfile,
                  child: Text('Update Profile'),
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
