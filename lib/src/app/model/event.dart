class Event {
  final String id;
  final String eventId;
  final String eventName;
  final String description;
  final double latitude;
  final double longitude;
  final String startTime;
  final String endTime;
  final String creator;
  final String type;
  final List<String> eventTag;
  final String eventPlace;

  Event({
    required this.id,
    required this.eventId,
    required this.eventName,
    required this.description,
    required this.latitude,
    required this.longitude,
    required this.startTime,
    required this.endTime,
    required this.creator,
    required this.type,
    required this.eventTag,
    required this.eventPlace,
  });

  // Convert an Event instance to a Map (JSON)
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'event_id': eventId,
      'event_name': eventName,
      'description': description,
      'location': {
        'type': type,
        'coordinates': [longitude, latitude],
      },
      'start_time': startTime,
      'end_time': endTime,
      'creator': creator,
      'event_tag': eventTag,
      'event_place': eventPlace,
    };
  }

  // Create an Event instance from a Map (JSON)
  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
      id: json['id'] ?? '',
      eventId: json['event_id'] ?? '',
      eventName: json['event_name'] ?? '',
      description: json['description'] ?? '',
      latitude: json['location']?['coordinates']?[1] ?? 0.0,
      longitude: json['location']?['coordinates']?[0] ?? 0.0,
      startTime: json['start_time'] ?? '',
      endTime: json['end_time'] ?? '',
      creator: json['creator'] ?? '',
      type: json['location']?['type'] ?? '',
      eventTag: (json['event_tag'] as List<dynamic>? ?? []).map((tag) => tag as String).toList(),
      eventPlace: json['event_place'] ?? '',
    );
  }
}
