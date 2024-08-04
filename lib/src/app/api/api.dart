import 'package:dio/dio.dart';
import 'package:untitled/src/app/model/create_event.dart';
import 'package:untitled/src/app/model/event.dart';

class Apis {
  static final Dio _dio = Dio();
  final String baseUrl = "http://127.0.0.1:8001";

  Future<List<Event>> getEvent(String type) async {
    final res = await _dio.get("$baseUrl/events/tag/$type");
    final List<dynamic> data = res.data;

    List<Event> events = [];

    for (int i = 0; i < data.length; i++) {
      events.add(Event.fromJson(data[i]));
    }
    return events;
  }

  Future<List<Event>> getBookMarks(String name) async {
    final res = await _dio.get("$baseUrl/getBookmarks/aman");
    final List<dynamic> data = res.data;

    List<Event> events = [];

    for (int i = 0; i < data.length; i++) {
      events.add(Event.fromJson(data[i]));
    }
    return events;
  }

  Future<void> creatEvent(CreateEvent event) async {
    await _dio.post(
      "$baseUrl/events",
      options: Options(headers: {
        "X-Creator-Name": "Aman",
      }),
      data: {
        "event_name": event.title,
        "description":
            event.desc,
        "location": {
          "type": "Point",
          "coordinates": [event.location.longitude, event.location.latitude]
        },
        "event_tag": ["sports"],
        "event_place": event.eventPlace,
        "start_time": "2024-08-4T09:00:00.000+00:00",
        "end_time": "2024-08-4T09:00:00.000+00:00",
        "creator": "aman"
      },
    );
    print("ok");
  }
}
