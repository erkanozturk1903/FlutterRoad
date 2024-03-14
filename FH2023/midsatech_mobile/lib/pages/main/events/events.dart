// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_final_fields, library_private_types_in_public_api, unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:midsatech_mobile/pages/main/events/model/task_model.dart';
import 'package:table_calendar/table_calendar.dart';

class EventPage extends StatefulWidget {
  @override
  _EventPageState createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  Map<DateTime, List<Task>> _selectedEvents = {};
  List<Task> _allGorevler = [];

  TextEditingController _adiController = TextEditingController();
  TextEditingController _yeriController = TextEditingController();
  TextEditingController _saatiController = TextEditingController();
  TextEditingController _amaciController = TextEditingController();

  void _gorevEkleOrUpdate({Task? existingGorev}) {
    final yeniGorev = Task(
      taskName: _adiController.text,
      taskLocation: _yeriController.text,
      taskHour: _saatiController.text,
      taskDescription: _amaciController.text,
      taskDate: existingGorev?.taskDate ?? _focusedDay, // Düzeltilen satır
    );

    if (existingGorev != null) {
      // Görevi güncelle
      _allGorevler[_allGorevler.indexOf(existingGorev)] = yeniGorev;
      _selectedEvents[existingGorev.taskDate]!.remove(existingGorev);
      if (_selectedEvents[yeniGorev.taskDate] != null) {
        _selectedEvents[yeniGorev.taskDate]!.add(yeniGorev);
      } else {
        _selectedEvents[yeniGorev.taskDate] = [yeniGorev];
      }
    } else {
      // Yeni görev ekle
      if (_selectedEvents[_focusedDay] != null) {
        _selectedEvents[_focusedDay]!.add(yeniGorev);
      } else {
        _selectedEvents[_focusedDay] = [yeniGorev];
      }
      _allGorevler.add(yeniGorev);
    }

    _adiController.clear();
    _yeriController.clear();
    _saatiController.clear();
    _amaciController.clear();
    Navigator.of(context).pop(); // Diyalog penceresini kapat
    setState(() {}); // Değişiklikleri yansıtmak için ekranı yenile
  }

  void _showAddOrUpdateDialog({Task? existingGorev}) {
    if (existingGorev != null) {
      // Mevcut görev bilgileri ile doldur
      _adiController.text = existingGorev.taskName!;
      _yeriController.text = existingGorev.taskLocation!;
      _saatiController.text = existingGorev.taskHour!;
      _amaciController.text = existingGorev.taskDescription!;
    }

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(existingGorev == null ? "Task Details" : "Edit Task "),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _adiController,
                decoration: InputDecoration(hintText: "Task Name"),
              ),
              TextField(
                controller: _yeriController,
                decoration: InputDecoration(hintText: "Task Location"),
              ),
              TextField(
                controller: _saatiController,
                decoration: InputDecoration(hintText: "Task Hour"),
              ),
              TextField(
                controller: _amaciController,
                decoration: InputDecoration(hintText: "Task Description"),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => _gorevEkleOrUpdate(existingGorev: existingGorev),
            child: Text(existingGorev == null ? "Save" : "Update"),
          ),
        ],
      ),
    );
  }

  void _deleteGorev(Task gorev) {
    _selectedEvents[gorev.taskDate]!.remove(gorev);
    _allGorevler.remove(gorev);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Events Management"),
      ),
      body: Column(
        children: [
          TableCalendar(
            firstDay: DateTime.utc(2010, 10, 16),
            lastDay: DateTime.utc(2030, 3, 14),
            focusedDay: _focusedDay,
            calendarFormat: _calendarFormat,
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                _focusedDay = focusedDay;
              });
              _showAddOrUpdateDialog();
            },
            onFormatChanged: (format) {
              setState(() {
                _calendarFormat = format;
              });
            },
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _allGorevler.length,
              itemBuilder: (context, index) {
                final gorev = _allGorevler[index];
                return Dismissible(
                  key: Key(gorev.taskName!),
                  background: Container(
                      color: Colors.green,
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: Icon(Icons.edit, color: Colors.white))),
                  secondaryBackground: Container(
                      color: Colors.red,
                      child: Align(
                          alignment: Alignment.centerRight,
                          child: Icon(Icons.delete, color: Colors.white))),
                  confirmDismiss: (direction) async {
                    if (direction == DismissDirection.endToStart) {
                      _deleteGorev(gorev);
                      return true;
                    } else {
                      _showAddOrUpdateDialog(existingGorev: gorev);
                      return false;
                    }
                  },
                  child: ListTile(
                    title: Text(gorev.taskName!),
                    subtitle: Text(
                        "${gorev.taskDate!.day}/${gorev.taskDate!.month}/${gorev.taskDate!.year} - ${gorev.taskLocation}"),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
