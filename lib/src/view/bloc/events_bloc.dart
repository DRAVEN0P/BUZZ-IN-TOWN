import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:untitled/src/app/api/api.dart';
import 'package:untitled/src/app/model/event.dart';
import 'package:untitled/src/app/utils/utils.dart';

part 'events_event.dart';
part 'events_state.dart';

class EventsBloc extends Bloc<EventsEvent, EventsState> {
  final Apis apis = Apis();

  EventsBloc() : super(EventsState()) {
    on<EventsEvent>((event, emit) {
      // TODO: implement event handler
      Utils.showProgressBar(event.context);
    });
    on<GetAllEvents>(_getAll);
    on<GetAllBookMarks>(_getBookmark);
  }

  _getAll(GetAllEvents event, Emitter<EventsState> emit) async {
    List<Event> events = await apis.getEvent(event.type);
    emit(state.copyWith(events: events));
    event.context.pop();
  }

  _getBookmark(GetAllBookMarks event, Emitter<EventsState> emit) async {
    List<Event> bookMark = await apis.getBookMarks(event.name);
    emit(state.copyWith(bookMark: bookMark));
    event.context.pop();
  }
}
