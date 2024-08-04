part of 'events_bloc.dart';

class EventsState extends Equatable {
  final List<Event> events;
  final List<Event> bookMark;

  const EventsState({
    this.events = const [],
    this.bookMark = const [],
  });

  EventsState copyWith({List<Event>? events,List<Event>? bookMark}) {
    return EventsState(
      events: events ?? this.events,
      bookMark: bookMark ?? this.bookMark
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [events,bookMark];
}
