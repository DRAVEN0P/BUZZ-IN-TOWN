part of 'events_bloc.dart';

sealed class EventsEvent extends Equatable {
  final BuildContext context;

  const EventsEvent(this.context);
}

class GetAllEvents extends EventsEvent {
  final String type;

  const GetAllEvents(super.context, this.type);

  @override
  // TODO: implement props
  List<Object> get props => [type];
}
