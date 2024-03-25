// ignore_for_file: unused_field

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:midsatech_mobile/pages/main/dashboard/task_detailpage.dart';

class DashboardPage extends StatefulWidget {
  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _timeController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _purposeController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Future<void> _submitTask() async {
      try {
        await FirebaseFirestore.instance.collection('tasks').add({
          'date': _dateController.text,
          'time': _timeController.text,
          'location': _locationController.text,
          'purpose': _purposeController.text,
        });

        // Görev eklendikten sonra form alanlarını temizle
        _dateController.clear();
        _timeController.clear();
        _locationController.clear();
        _purposeController.clear();

        Navigator.pop(context); // Dialog penceresini kapat
      } catch (e) {
        // Hata durumunda kullanıcıya bildir
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('error'.tr),
            content: Text('an_error_occurred_please_try_again_later'.tr),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text('ok'.tr),
              ),
            ],
          ),
        );
      }
    }

    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('tasks').snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('error: ${snapshot.error}'.tr));
          }
          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Center(child: Text('no_task_found'.tr));
          }
          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              var task = snapshot.data!.docs[index];
              return Card(
                elevation: 2,
                margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: ListTile(
                  title: Text('Date: ${task['date']}, Time: ${task['time']}'),
                  subtitle: Text('Location: ${task['location']}'),
                  onTap: () {
                    // Görev detayları sayfasına git
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TaskDetailPage(
                          task: task
                              as QueryDocumentSnapshot<Map<String, dynamic>>,
                        ),
                      ),
                    );
                  },
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepOrange,
        onPressed: () {
          // Görev ekleme formunu göster
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text('add_task'.tr),
              content: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextFormField(
                        controller: _dateController,
                        decoration: InputDecoration(
                          labelText: 'date'.tr,
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'please_enter_a_date'.tr;
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 16),
                      TextFormField(
                        controller: _timeController,
                        decoration: InputDecoration(
                          labelText: 'time'.tr,
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'please_enter_a_time'.tr;
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 16),
                      TextFormField(
                        controller: _locationController,
                        decoration: InputDecoration(
                          labelText: 'location'.tr,
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'please_enter_a_location'.tr;
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 16),
                      TextFormField(
                        controller: _purposeController,
                        decoration: InputDecoration(
                          labelText: 'purpose'.tr,
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return '';
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
              ),
              actions: [
                ElevatedButton(
                  onPressed: () {
                    // Formu gönder
                    if (_formKey.currentState!.validate()) {
                      _submitTask();
                    }
                  },
                  child: Text('submit'.tr),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('cancel'.tr),
                ),
              ],
            ),
          );
        },
        child: Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
