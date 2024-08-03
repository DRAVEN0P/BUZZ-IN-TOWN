import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Utils {
  static String formatData(String date) {
    String dateString = date;

    // Parse the date string to a DateTime object
    DateTime dateTime = DateTime.parse(dateString);

    // Format the DateTime object to get the abbreviated day of the week
    String dayOfWeek = DateFormat('E')
        .format(dateTime); // 'E' gives abbreviated day (e.g., Mon)

    // Format the DateTime object to get the abbreviated month name
    String abbreviatedMonth = DateFormat('MMM').format(dateTime); // e.g., Aug
    // print('Abbreviated Month: $abbreviatedMonth');

    int day = dateTime.day;
    // print('Day: $day'); // e.g., 10
    int year = dateTime.year;
    // print('Year: $year');

    return "$dayOfWeek, $abbreviatedMonth $day, $year ";
  }

  static String formatTime(String date){
    String dateTimeString = '2024-08-15T09:00:00Z';

    // Parse the date-time string to a DateTime object
    DateTime dateTime = DateTime.parse(dateTimeString);

    // Extract time components
    int hour = dateTime.hour;
    int minute = dateTime.minute;
    int second = dateTime.second;

    // Format the time as a string (e.g., "09:00:00")
    String formattedTime = '${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')}';

    return formattedTime;
  }

  static void showProgressBar(BuildContext context){
    showDialog(context: context, builder: (_) => const Center(child: CircularProgressIndicator()));
  }
}
