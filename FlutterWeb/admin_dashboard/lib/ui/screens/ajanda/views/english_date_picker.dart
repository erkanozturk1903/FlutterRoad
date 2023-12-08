import 'package:admin_dashboard/ui/screens/ajanda/views/date_time_picker/datetime_picker.dart';
import 'package:admin_dashboard/ui/screens/ajanda/views/date_time_picker/src/i18n_model.dart';
import 'package:flutter/material.dart';

class EnglishDatePicker extends StatefulWidget {
  final String title;
  final Widget? subTitleWidget;
  final void Function(DateTime?)? onChange;
  final DateTime? initialTime;
  final DateTime? minTime;
  final DateTime? maxTime;
  const EnglishDatePicker(
      {super.key,
      required this.title,
      this.subTitleWidget,
      this.onChange,
      this.initialTime,
      this.minTime,
      this.maxTime});

  @override
  State<EnglishDatePicker> createState() => _EnglishDatePickerState();
}

class _EnglishDatePickerState extends State<EnglishDatePicker> {
  DateTime _data = DateTime(1410, 12, 31);

  @override
  void initState() {
    super.initState();
    _data = widget.initialTime ?? DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Column(
        children: [
          TextButton(
            child: Text(widget.title),
            onPressed: () {
              DatePicker.showDatePicker(context,
                  showTitleActions: true,
                  minTime: widget.minTime ?? DateTime(1800, 1, 1),
                  maxTime: widget.maxTime ?? DateTime(2040, 12, 31),
                  onChanged: (date) {}, onConfirm: (date) {
                setState(() {
                  _data = date.toLocal();

                  // print(data);
                });
                widget.onChange!(date);
                // print('confirm $date');
              }, currentTime: _data, locale: LocaleType.tr);
            },
          ),
          const SizedBox(
            height: 8,
          ),
          Text("${_data.year}/${_data.month}/${_data.day}"),
          const SizedBox(
            height: 8,
          ),
          widget.subTitleWidget ?? Container(),
        ],
      ),
    );
  }
}
