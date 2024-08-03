part of 'events_bloc.dart';

class EventsState extends Equatable {
  final List<Event> events;

  const EventsState({this.events = const []});

  EventsState copyWith({List<Event>? events}) {
    return EventsState(
      events: events ?? this.events,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [events];
}
