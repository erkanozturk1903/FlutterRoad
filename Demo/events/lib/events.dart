// ignore_for_file: unused_field, prefer_final_fields, duplicate_ignore

import 'package:events/app_localizations.dart';
import 'package:events/fx_button.dart';
import 'package:events/fx_english_date_picker.dart';
import 'package:events/fx_text.dart';
import 'package:events/fx_text_field.dart';
import 'package:events/fx_v_spacer.dart';
import 'package:events/responsive_layout.dart';
import 'package:events/structure_dims.dart';
import 'package:events/structure_style.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class EventsCalendar extends StatefulWidget {
  final void Function(CalendarTapDetails)? onTapCell;
  final void Function(Appointment)? onAddEvent;
  final void Function(Appointment)? onEditEvent;
  final void Function(List<Appointment>)? onDeleteEvent;
  final List<Appointment>? appointmentsList;
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
  const EventsCalendar({
    super.key,
    this.onTapCell,
    this.onAddEvent,
    this.onEditEvent,
    this.onDeleteEvent,
    this.appointmentsList,
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
  State<EventsCalendar> createState() => _EventsCalendarState();
}

class _EventsCalendarState extends State<EventsCalendar> {
  final List<Appointment> _appointments = <Appointment>[];
  final CalendarController _calendarController = CalendarController();
  final TextEditingController _addController = TextEditingController();
  final TextEditingController _editController = TextEditingController();

  late Appointment _draggedAppointment;
  late DateTime _newAppointmentDate;

  DateTime _date = DateTime.now();
  DateTime _dateAdd = DateTime.now();

  // ignore: prefer_final_fields
  DateTime _dateEdit = DateTime.now();

  @override
  void initState() {
    super.initState();
    // Add some sample appointments
    _appointments.add(Appointment(
      startTime: DateTime.now().add(const Duration(days: 1)),
      endTime: DateTime.now().add(const Duration(days: 1, hours: 1)),
      subject: 'Event 1',
      color: const Color(0xffF0F4F9),
    ));

    _appointments.add(
      Appointment(
        startTime: DateTime.now().add(const Duration(days: 3)),
        endTime: DateTime.now().add(const Duration(days: 7, hours: 1)),
        subject: 'Event 2',
        color: const Color(0xffF0F4F9),
      ),
    );
    _appointments.add(
      Appointment(
        startTime: DateTime.now().add(const Duration(days: 7)),
        endTime: DateTime.now().add(const Duration(days: 7, hours: 1)),
        subject: 'Event 3',
        color: const Color(0xffF0F4F9),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: DefaultDims.space25(context) * 7,
      padding: EdgeInsets.all(
        DefaultDims.space5(context),
      ),
      decoration: BoxDecoration(
        color: Color(0xFFffffff),
        borderRadius: BorderRadius.all(
          Radius.circular(
            DefaultDims.border5(context),
          ),
        ),
      ),
      child: SfCalendar(
        view: CalendarView.month,
        controller: _calendarController,
        dataSource: _getDataSource(),
        headerStyle: const CalendarHeaderStyle(
          textStyle: TextStyle(
            //fontFamily: InitialConfig.fontFamily,
            color: Color(0xFFA1A1A1),
            fontSize: 12,
          ),
        ),
        viewHeaderStyle: const ViewHeaderStyle(
            dayTextStyle: TextStyle(
          color: Color(0xFFA1A1A1),
          fontSize: 12,
        )),
        resourceViewHeaderBuilder: (context, details) {
          return Container();
        },
        appointmentBuilder: _appointmentBuilder,
        monthCellBuilder: _monthCellBuilder,
        onTap: (detail) {
          setState(() {
            _date = detail.date ?? DateTime.now();
            _dateAdd = detail.date ?? DateTime.now();
          });
          _addEvent(context);
          widget.onTapCell!(detail);
        },
        onLongPress: (details) {
          _draggedAppointment = details.appointments!.first;
          _newAppointmentDate = details.date!;
          setState(() {});
          widget.onLongPressCell!(details);
        },
        onDragUpdate: (details) {
          // _newAppointmentDate = details.date;
          setState(() {});
          widget.onDragUpdateCell!(details);
        },
        onDragEnd: (details) {
          _draggedAppointment.startTime =
              _newAppointmentDate.subtract(const Duration(hours: 1));
          _draggedAppointment.endTime = _newAppointmentDate;
          setState(() {});
          widget.onDragEndCell!(details);
        },
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
          child: FxText(
            '+More',
            color: InitialStyle.primaryColor,
            tag: Tag.h5,
          ),
          onTap: () {
            _showMoreEvents(context, details);
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
              border: Border.all(color: InitialStyle.border),
              borderRadius: BorderRadius.circular(InitialDims.border1),
            ),
            alignment: Alignment.center,
            child: FxText(
              appointment.subject,
              color: InitialStyle.onPrimaryColor,
              tag: Tag.h6,
            )),
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
          child: FxText(
            appointment.subject,
            color: InitialStyle.onPrimaryColor,
            tag: Tag.h5,
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

  Widget _monthCellBuilder(BuildContext context, MonthCellDetails details) {
    return Container(
      decoration: BoxDecoration(
        color: (details.date.day == DateTime.now().day &&
                details.date.month == DateTime.now().month)
            ? Color(0xFF8C8E93)
            : Colors.transparent,
        border: Border.all(
          color: Color(0xff0E1726),
        ),
      ),
      child: Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: EdgeInsets.all(4),
            child: FxText(details.date.day.toString(),
                color: details.date.month == DateTime.now().month
                    ? Color(0xFFA1A1A1)
                    : Color(0xff0E1726)),
          )),
    );
  }

  _DataSource _getDataSource() {
    return _DataSource(widget.appointmentsList ?? _appointments);
  }

  Future<dynamic> _addEvent(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: FxText(
            AppLocalizations.of(context)!.addevent,
          ),
          backgroundColor: InitialStyle.cardColor,
          actions: <Widget>[
            Column(
              children: [
                FxText(
                  AppLocalizations.of(context)!.pleaseentereventname,
                ),
                const FxVSpacer(
                  big: true,
                ),
                FxTextField(
                  controller: _addController,
                ),
                const FxVSpacer(
                  big: true,
                ),
                FxEnglishDatePicker(
                  title: AppLocalizations.of(context)!.pickenddate,
                  initialTime: _dateAdd,
                  onChange: (date) {
                    setState(() {
                      _dateAdd = date ?? _date;
                    });
                    Navigator.pop(context, date);
                  },
                ),
                const FxVSpacer(
                  big: true,
                ),
                FxButton(
                  text: AppLocalizations.of(context)!.ok,
                  onTap: () {
                    setState(() {
                      _appointments.add(
                        Appointment(
                          startTime: _dateAdd,
                          endTime: _dateAdd.add(Duration(hours: 1)),
                          subject: _addController.text,
                        ),
                      );
                      _addController.text = "";
                    });

                    Navigator.pop(context);
                  },
                )
              ],
            ),
          ],
        );
      },
    ).then((val) {
      setState(() {
        if (val.runtimeType == DateTime.now().runtimeType) {
          _appointments.add(
            Appointment(
                startTime: _dateAdd,
                endTime: _dateAdd.add(Duration(hours: 1)),
                subject: _addController.text,
                color: InitialStyle.primaryColor),
          );

          widget.onAddEvent!(
            Appointment(
                startTime: _dateAdd,
                endTime: _dateAdd.add(const Duration(hours: 1)),
                subject: _addController.text,
                color: InitialStyle.primaryColor),
          );
        }

        _addController.text = "";
      });
    });
  }

  Future<dynamic> _editEvent(BuildContext context, int id) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: FxText(
            AppLocalizations.of(context)!.editevent,
          ),
          backgroundColor: InitialStyle.cardColor,
          actions: <Widget>[
            Column(
              children: [
                FxText(
                  AppLocalizations.of(context)!.pleaseediteventname,
                ),
                const FxVSpacer(
                  big: true,
                ),
                FxTextField(
                  controller: _editController,
                  maxLines: 7,
                ),
                const FxVSpacer(
                  big: true,
                ),
                FxEnglishDatePicker(
                  title: AppLocalizations.of(context)!.pickenddate,
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
                const FxVSpacer(
                  big: true,
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
                        color: InitialStyle.dangerColorRegular,
                      ),
                    ),
                    FxButton(
                      text: AppLocalizations.of(context)!.ok,
                      onTap: () {
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

  int _getAppointmentIndex(int id) {
    int appointmentIndex = 0;

    for (int i = 0; i < _appointments.length; i++) {
      if (_appointments[i].id == id) {
        appointmentIndex = i;
      }
    }
    return appointmentIndex;
  }

  Future<dynamic> _showMoreEvents(
      BuildContext context, CalendarAppointmentDetails details) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: InitialStyle.cardColor,
          actions: <Widget>[
            SizedBox(
              height: InitialDims.space25 * 4,
              width: double.infinity,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FxText(
                      "Events",
                      color: InitialStyle.titleTextColor,
                    ),
                    FxVSpacer(),
                    ...List.generate(details.appointments.length, (index) {
                      final Appointment appointment =
                          details.appointments.elementAt(index);
                      return Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: InitialDims.space2),
                        child: InkWell(
                          child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: InitialDims.space2),
                              alignment: Alignment.center,
                              height: InitialDims.space10,
                              decoration: BoxDecoration(
                                color: appointment.color,
                                borderRadius:
                                    BorderRadius.circular(InitialDims.border1),
                              ),
                              child: FxText(
                                appointment.subject,
                                color: InitialStyle.onPrimaryColor,
                                tag: Tag.h5,
                              )),
                          onTap: () {
                            setState(() {
                              _date = details.date;
                              _editController.text =
                                  details.appointments.first.subject;
                            });

                            _editEvent(context, details.appointments.first.id);
                          },
                        ),
                      );
                    })
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

class _DataSource extends CalendarDataSource {
  _DataSource(List<Appointment> source) {
    appointments = source;
  }
}

class DefaultDims {
  static double screenFactor(BuildContext context) {
    if (ResponsiveLayot.isPhone(context)) {
      return 190;
    }

    return 224;
  }

  static double space0(BuildContext context) => 0;
  static double space1(BuildContext context) =>
      screenFactor(context) * 0.01785; //4
  static double space2(BuildContext context) =>
      screenFactor(context) * 0.0357; //8
  static double space3(BuildContext context) =>
      screenFactor(context) * 0.05357; //12
  static double space4(BuildContext context) =>
      screenFactor(context) * 0.0714; //16
  static double space5(BuildContext context) =>
      screenFactor(context) * 0.0892; //20
  static double space6(BuildContext context) =>
      screenFactor(context) * 0.1071; //24
  static double space7(BuildContext context) =>
      screenFactor(context) * 0.125; //28
  static double space8(BuildContext context) =>
      screenFactor(context) * 0.1428; //32
  static double space9(BuildContext context) =>
      screenFactor(context) * 0.1607; //36
  static double space10(BuildContext context) =>
      screenFactor(context) * 0.1785; //40
  static double space11(BuildContext context) =>
      screenFactor(context) * 0.1964; //44
  static double space12(BuildContext context) =>
      screenFactor(context) * 0.2142; //48
  static double space13(BuildContext context) =>
      screenFactor(context) * 0.2321; //52
  static double space14(BuildContext context) =>
      screenFactor(context) * 0.25; //56
  static double space15(BuildContext context) =>
      screenFactor(context) * 0.2678; //60
  static double space16(BuildContext context) =>
      screenFactor(context) * 0.2857; //64
  static double space17(BuildContext context) =>
      screenFactor(context) * 0.3035; //68
  static double space18(BuildContext context) =>
      screenFactor(context) * 0.3214; //72
  static double space19(BuildContext context) =>
      screenFactor(context) * 0.3392; //76
  static double space20(BuildContext context) =>
      screenFactor(context) * 0.3571; //80
  static double space21(BuildContext context) =>
      screenFactor(context) * 0.375; //84
  static double space22(BuildContext context) =>
      screenFactor(context) * 0.3928; //88
  static double space23(BuildContext context) =>
      screenFactor(context) * 0.4107; //92
  static double space24(BuildContext context) =>
      screenFactor(context) * 0.4285; //96
  static double space25(BuildContext context) =>
      screenFactor(context) * 0.4464; //100

  static double icon1(BuildContext context) =>
      screenFactor(context) * 0.026; //6
  static double icon2(BuildContext context) =>
      screenFactor(context) * 0.0535; //12
  static double icon3(BuildContext context) =>
      screenFactor(context) * 0.0803; //18
  static double icon4(BuildContext context) =>
      screenFactor(context) * 0.1071; //24
  static double icon5(BuildContext context) =>
      screenFactor(context) * 0.1319; //30
  static double icon6(BuildContext context) =>
      screenFactor(context) * 0.1607; //36
  static double icon7(BuildContext context) =>
      screenFactor(context) * 0.1875; //42
  static double icon8(BuildContext context) =>
      screenFactor(context) * 0.2142; //48
  static double icon9(BuildContext context) =>
      screenFactor(context) * 0.2410; //54
  static double icon10(BuildContext context) =>
      screenFactor(context) * 0.2678; //60

  static double border0(BuildContext context) => 0;
  static double border1(BuildContext context) =>
      screenFactor(context) * 0.02232; //5
  static double border2(BuildContext context) =>
      screenFactor(context) * 0.04464; //10
  static double border3(BuildContext context) =>
      screenFactor(context) * 0.06696; //15
  static double border4(BuildContext context) =>
      screenFactor(context) * 0.08928; //20
  static double border5(BuildContext context) =>
      screenFactor(context) * 0.11160; //25
  static double defaultBorder(BuildContext context) =>
      screenFactor(context) * 0.06696; //25
  static double fullBorder(BuildContext context) =>
      screenFactor(context) * 1000; //25

  static double extraTitleFontSize(BuildContext context) =>
      screenFactor(context) * 0.321;

  static double bigTitleFontSize(BuildContext context) =>
      screenFactor(context) * 0.214;

  static double highTitleFontSize(BuildContext context) =>
      screenFactor(context) * 0.142;

  static double midTitleFontSize(BuildContext context) =>
      screenFactor(context) * 0.107;

  static double titleFontSize(BuildContext context) =>
      screenFactor(context) * 0.089;

  static double normalFontSize(BuildContext context) =>
      screenFactor(context) * 0.071;

  static double subtitleFontSize(BuildContext context) =>
      screenFactor(context) * 0.0535;

  static double smallFontSize(BuildContext context) =>
      screenFactor(context) * 0.0446;
}
