// ignore_for_file: prefer_const_constructors

import 'package:admin_dashboard/ui/screens/ajanda/views/english_date_picker.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class AjandaScreen extends StatefulWidget {
  final List<Appointment>? appointmentsList;
  final void Function(CalendarTapDetails)? onTapCell;
  final void Function(Appointment)? onAddEvent;
  final void Function(Appointment)? onEditEvent;
  final void Function(List<Appointment>)? onDeleteEvent;
  final void Function(CalendarLongPressDetails)? onLongPressCell;
  final void Function(AppointmentDragUpdateDetails)? onDragUpdateCell;
  final void Function(AppointmentDragEndDetails)? onDragEndCell;
  final void Function(ViewChangedDetails)? onViewChanged;
  final void Function(AppointmentResizeEndDetails)? onAppointmentResizeEndCell;
  final void Function(AppointmentResizeStartDetails)?
      onAppointmentResizeStartCell;
  final void Function(AppointmentResizeUpdateDetails)?
      onAppointmentResizeUpdateCell;
  final void Function(AppointmentDragStartDetails)? onDragStartCell;
  final void Function(CalendarSelectionDetails)? onSelectionChangedCell;

  const AjandaScreen({
    super.key,
    this.appointmentsList,
    this.onTapCell,
    this.onAddEvent,
    this.onEditEvent,
    this.onDeleteEvent,
    this.onLongPressCell,
    this.onDragUpdateCell,
    this.onDragEndCell,
    this.onViewChanged,
    this.onAppointmentResizeEndCell,
    this.onAppointmentResizeStartCell,
    this.onAppointmentResizeUpdateCell,
    this.onDragStartCell,
    this.onSelectionChangedCell,
  });

  @override
  State<AjandaScreen> createState() => _AjandaScreenState();
}

class _AjandaScreenState extends State<AjandaScreen> {
  final CalendarController _calendarController = CalendarController();
  final TextEditingController _addController = TextEditingController();
  final TextEditingController _editController = TextEditingController();
  final List<Appointment> _appointments = <Appointment>[];

  late Appointment _draggedAppointment;
  late DateTime _newAppointmentDate;

  DateTime _date = DateTime.now();
  DateTime _dateAdd = DateTime.now();

  // ignore: prefer_final_fields
  DateTime _dateEdit = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 28,
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        color: Color(0xFFffffff),
        borderRadius: BorderRadius.all(
          Radius.circular(25),
        ),
      ),
      child: SfCalendar(
        controller: _calendarController,
        view: CalendarView.month,
        dataSource: _getDataSource(),
        headerStyle: CalendarHeaderStyle(
          textStyle: GoogleFonts.roboto(
            color: Color(0xff707479),
            fontSize: 20,
          ),
        ),
        viewHeaderStyle: ViewHeaderStyle(
          dayTextStyle: GoogleFonts.roboto(
            color: Color(0xff707479),
            fontSize: 16,
          ),
        ),
        resourceViewHeaderBuilder: (context, details) {
          return Container();
        },
        appointmentBuilder: _appointmentBuilder,
        monthCellBuilder: _monthCellBuilder,
      ),
    );
  }

  Widget _appointmentBuilder(
      BuildContext context, CalendarAppointmentDetails details) {
    if (details.isMoreAppointmentRegion) {
      return SizedBox(
        width: details.bounds.width,
        height: details.bounds.height,
        child: InkWell(
          child: Text(
            '+More',
            style: TextStyle(color: Color(0xff3761EB), fontSize: 12),
          ),
          onTap: () {
            //_showMoreEvents(context, details);
          },
        ),
      );
    } else if (_calendarController.view == CalendarView.month) {
      final Appointment appointment = details.appointments.first;
      return InkWell(
        child: Container(
          width: details.bounds.width,
          height: details.bounds.height,
          decoration: BoxDecoration(
            color: appointment.color,
            border: Border.all(
              color: Color(0xffE4E6E8),
            ),
            borderRadius: BorderRadius.circular(5),
          ),
          alignment: Alignment.center,
          child: Text(
            appointment.subject,
            style: TextStyle(
              color: Color(0xffFFFFFF),
              fontSize: 10,
            ),
          ),
        ),
        onTap: () {
          setState(() {
            _date = details.date;
            _editController.text = details.appointments.first.subject;
          });

          _editEvent(context, details.appointments.first.id);
        },
      );
    } else {
      final Appointment appointment = details.appointments.first;
      return SizedBox(
        width: details.bounds.width,
        height: details.bounds.height,
        child: InkWell(
          child: Text(
            appointment.subject,
            style: TextStyle(
              color: Color(0xffFFFFFF),
              fontSize: 10,
            ),
          ),
          onTap: () {
            setState(() {
              _date = details.date;
              _editController.text = details.appointments.first.subject;
            });

            _editEvent(context, details.appointments.first.id);
          },
        ),
      );
    }
  }

  Future<dynamic> _editEvent(BuildContext context, int id) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Düzenle',
          ),
          backgroundColor: Color(0xffFFFFFF),
          actions: <Widget>[
            Column(
              children: [
                Text(
                  'AppLocalizations.of(context)!.pleaseediteventname',
                ),
                SizedBox(
                  height: 8,
                ),
                TextField(
                  controller: _editController,
                  maxLines: 7,
                ),
                SizedBox(
                  height: 8,
                ),
                EnglishDatePicker(
                  title: 'Seçilen Tarih',
                  initialTime: _dateEdit,
                  onChange: (editDate) {
                    _appointments[_getAppointmentIndex(id)].subject =
                        _editController.text;
                    _appointments[_getAppointmentIndex(id)].startTime =
                        editDate ?? _date;
                    _appointments[_getAppointmentIndex(id)].endTime =
                        (editDate ?? _date).add(Duration(hours: 1));
                    widget
                        .onEditEvent!(_appointments[_getAppointmentIndex(id)]);
                    Navigator.pop(context);
                  },
                ),
                SizedBox(
                  height: 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        _appointments
                            .remove(_appointments[_getAppointmentIndex(id)]);
                        setState(() {});
                        widget.onDeleteEvent!(_appointments);
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.delete,
                        color: Colors.red,
                      ),
                    ),
                    TextButton(
                      child: Text('Tamam'),
                      onPressed: () {
                        _appointments[_getAppointmentIndex(id)].subject =
                            _editController.text;
                        widget.onEditEvent!(
                            _appointments[_getAppointmentIndex(id)]);
                        Navigator.pop(context);
                      },
                    )
                  ],
                ),
              ],
            ),
          ],
        );
      },
    ).then((val) {
      setState(() {
        _editController.text = "";
      });
    });
  }

  Widget _monthCellBuilder(BuildContext context, MonthCellDetails details) {
    return Container(
      decoration: BoxDecoration(
        color: (details.date.day == DateTime.now().day &&
                details.date.month == DateTime.now().month)
            ? Color(0xffB1B1B1)
            : Colors.transparent,
        border: Border.all(
          color: Color(0xffB1B1B1),
        ),
      ),
      child: Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: EdgeInsets.all(4),
            child: Text(
              details.date.day.toString(),
              style: TextStyle(
                  color: details.date.month == DateTime.now().month
                      ? Color(0xff0F172A)
                      : Color(0xff707479)),
            ),
          )),
    );
  }

  int _getAppointmentIndex(int id) {
    int appointmentIndex = 0;

    for (int i = 0; i < _appointments.length; i++) {
      if (_appointments[i].id == id) {
        appointmentIndex = i;
      }
    }
    return appointmentIndex;
  }

  _DataSource _getDataSource() {
    return _DataSource(widget.appointmentsList ?? _appointments);
  }
}

class _DataSource extends CalendarDataSource {
  _DataSource(List<Appointment> source) {
    appointments = source;
  }
}
