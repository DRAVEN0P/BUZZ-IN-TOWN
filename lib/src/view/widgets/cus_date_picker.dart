import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:untitled/src/app/const/const.dart';

class CusDatePicker extends StatefulWidget {
  final ValueNotifier<String> dataNotifier;
  final String label;

  const CusDatePicker(this.dataNotifier, this.label);

  @override
  State<CusDatePicker> createState() => __DatePickerState();
}

class __DatePickerState extends State<CusDatePicker> {
  final TextEditingController dateController = TextEditingController();
  late DateTime date;
  late String formattedDate;

  @override
  void dispose() {
    dateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: mq.width * 0.4,
      child: TextField(
        controller: dateController,
        decoration: InputDecoration(
          icon: InkWell(
            borderRadius: BorderRadius.circular(10),
            onTap: () async {
              final result = await showCalendarDatePicker2Dialog(
                context: context,
                config: CalendarDatePicker2WithActionButtonsConfig(),
                dialogSize: const Size(325, 400),
              );
              setState(
                    () {
                  date = result![0]!.toUtc();
                  formattedDate =
                      DateFormat("yyyy-MM-ddTHH:mm:ss.SSS'Z'").format(date);
                  print(formattedDate);
                  widget.dataNotifier.value = formattedDate;
                  dateController.text =
                      widget.dataNotifier.value.toString().substring(0, 10);
                },
              );
              // print();
            },
            child: Icon(Icons.date_range),
          ),
          label: Text(widget.label),
          hintText: "YYYY-MM-DD",
        ),
        keyboardType: TextInputType.datetime,
      ),
    );
  }
}