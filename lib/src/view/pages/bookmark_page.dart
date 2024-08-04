import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/src/view/bloc/events_bloc.dart';
import 'package:untitled/src/view/widgets/bottom_bar.dart';
import 'package:untitled/src/view/widgets/upcoming_event_card.dart';

class BookmarkPage extends StatelessWidget {
  const BookmarkPage({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<EventsBloc>().add(GetAllBookMarks(context, "aman"));
    return Scaffold(
      body: SafeArea(
        child: Stack(children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 15, bottom: 10, top: 15),
                child: Text(
                  "Bookmarked Events",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 10,),
              Expanded(
                child: BlocBuilder<EventsBloc, EventsState>(
                  builder: (context, state) {
                    return ListView.separated(
                        separatorBuilder: (context, index) =>
                        const SizedBox(height: 10),
                        itemCount: state.bookMark.length,
                        itemBuilder: (context, index) {
                          return UpcomingEventCard();
                        });
                  },
                ),
              ),
            ],
          ),
          Positioned(
            left: 10,
            right: 10,
            bottom: 15,
            child: BottomBar(index: 2,),
          ),
        ]),
      ),
    );
  }
}
