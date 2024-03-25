// ignore_for_file: prefer_interpolation_to_compose_strings

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TaskDetailPage extends StatelessWidget {
  final QueryDocumentSnapshot<Map<String, dynamic>> task;

  const TaskDetailPage({Key? key, required this.task}) : super(key: key);

  Future<void> updateTask() async {
    // Görevi güncelleme işlemi buraya eklenebilir
    // Örnek olarak, 'tasks' koleksiyonunda task'ın id'si ile belirtilen belgeyi güncelleyelim
    await FirebaseFirestore.instance
        .collection('tasks')
        .doc(task.id)
        .update({'status': 'updated'});
  }

  Future<void> deleteTask() async {
    // Görevi silme işlemi buraya eklenebilir
    // Örnek olarak, 'tasks' koleksiyonunda task'ın id'si ile belirtilen belgeyi silelim
    await FirebaseFirestore.instance.collection('tasks').doc(task.id).delete();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('task_detail'.tr),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'date'.tr + ' : ' +  '${task['date']}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'time'.tr + ':' +  '${task['time']}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'location'.tr + ':' +  '${task['location']}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'purpose'.tr + ':' +  ' ${task['purpose']}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    updateTask();
                    Navigator.pop(context);
                  },
                  child: Text('update'.tr),
                ),
                ElevatedButton(
                  onPressed: () {
                    deleteTask();
                    Navigator.pop(context);
                  },
                  child: Text('delete'.tr),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
