import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:untitled/src/app/utils/utils.dart';
import 'package:untitled/src/view/bloc/events_bloc.dart';

class EventsCard extends StatelessWidget {
  const EventsCard({super.key, this.height = 265, this.path = "all"});

  final double height;
  final String path;

  @override
  Widget build(BuildContext context) {
    context.read<EventsBloc>().add(GetAllEvents(context, path));

    return Container(
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
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                height: 330,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15)),
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
                        state.events[i].eventName,
                        style: const TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
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
                            Utils.formatData(state.events[i].startTime),
                            style: const TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          const Text(
                            ":",
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            "${Utils.formatTime(state.events[i].startTime)} PM",
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
                            state.events[i].eventPlace,
                            style: const TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
