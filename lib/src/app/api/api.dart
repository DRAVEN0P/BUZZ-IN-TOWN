import 'package:dio/dio.dart';
import 'package:untitled/src/app/model/event.dart';

class Apis {
  static final Dio _dio = Dio();
  final String baseUrl = "http://127.0.0.1:8001/events";
  Future<List<Event>> getEvent(String type) async {
    final res =
        await _dio.get("$baseUrl/tag/$type");
    final List<dynamic> data = res.data;

    List<Event> events = [];

    for (int i = 0; i < data.length; i++) {
      events.add(Event.fromJson(data[i]));
    }
    return events;
  }
}
