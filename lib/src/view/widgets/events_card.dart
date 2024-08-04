import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:untitled/src/app/model/event.dart';
import 'package:untitled/src/app/utils/utils.dart';
import 'package:untitled/src/view/bloc/events_bloc.dart';

class EventsCard extends StatelessWidget {
  const EventsCard({super.key, this.height = 265, this.path = "all"});

  final double height;
  final String path;

  @override
  Widget build(BuildContext context) {
    context.read<EventsBloc>().add(GetAllEvents(context, path));

    return GestureDetector(
      onTap: () {
        context.go("/detail");
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        height: height,
        // color: Colors.yellow,
        child: BlocBuilder<EventsBloc, EventsState>(
          builder: (context, state) {
            return ListView.separated(
              separatorBuilder: (context, index) => const SizedBox(
                height: 10,
              ),
              itemCount: state.events.length,
              itemBuilder: (context, i) {
                return _EventDetailsCard(
                  event: state.events[i],
                );
              },
            );
          },
        ),
      ),
    );
  }
}

class _EventDetailsCard extends StatefulWidget {
  const _EventDetailsCard({super.key, required this.event});

  final Event event;

  @override
  State<_EventDetailsCard> createState() => _EventDetailsCardState();
}

class _EventDetailsCardState extends State<_EventDetailsCard> {
  bool isBookMarked = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      height: 330,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(15)),
      clipBehavior: Clip.hardEdge,
      child: Stack(
        children: [
          ClipRect(
            child: Align(
              alignment: Alignment.center,
              // Align to top, change to center, bottom as needed
              heightFactor: 0.7,
              child: Image.asset(
                'assets/race.jpeg',
              ),
            ),
          ),
          Positioned(
            left: 12,
            top: 215,
            child: Text(
              widget.event.eventName,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ),
          Positioned(
            left: 15,
            top: 255,
            child: Row(
              children: [
                const Icon(Icons.calendar_month),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  Utils.formatData(widget.event.startTime),
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
                Icon(Icons.access_time_outlined),
                Text(
                  " ${Utils.formatTime(widget.event.startTime)} PM",
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                )
              ],
            ),
          ),
          Positioned(
            left: 2,
            top: 275,
            child: Row(
              children: [
                IconButton(
                    onPressed: () {
                      context.go("/map");
                    },
                    icon: const Icon(Icons.location_on_outlined)),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  maxLines: 3,
                  widget.event.eventPlace,
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          const Positioned(
            bottom: 20,
            right: 20,
            child: Text(
              "Free",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          Positioned(
            top: 10,
            right: 0,
            child: IconButton(
              onPressed: () {
                setState(() {
                  isBookMarked = true;
                });
              },
              icon: Icon(
                Icons.bookmark,
                color: isBookMarked ? Colors.black : Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
