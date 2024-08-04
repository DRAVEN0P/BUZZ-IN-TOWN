import 'package:flutter/material.dart';
import 'package:untitled/src/view/widgets/bottom_bar.dart';
import 'package:untitled/src/view/widgets/upcoming_event_card.dart';

class EventPage extends StatelessWidget {
  const EventPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 15, bottom: 10,top: 15),
                child: Text(
                  "Upcoming Events",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 10,),
              Expanded(
                child: ListView.separated(
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 10),
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return UpcomingEventCard();
                    }),
              ),
            ],
          ),
          Positioned(
            left: 10,
            right: 10,
            bottom: 15,
            child: BottomBar(index: 1,),
          ),
        ]),
      ),
    );
  }
}
