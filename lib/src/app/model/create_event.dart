import 'package:google_maps_flutter/google_maps_flutter.dart';

class CreateEvent {
  final String title;
  final String desc;
  final LatLng location;
  final String tags;
  final String eventPlace;
  final String startTime;
  final String endTime;
  final String author;

  CreateEvent(
      {required this.title,
      required this.desc,
      required this.location,
      this.tags = "aman",
      required this.eventPlace,
      required this.startTime,
      required this.endTime,
      required this.author});
}
