import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:untitled/src/app/const/const.dart';
import 'package:untitled/src/view/bloc/events_bloc.dart';

class PopularEvents extends StatelessWidget {
  const PopularEvents({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      height: 100,
      child: ListView.separated(
        itemCount: popularEvents.length,
        separatorBuilder: (context, index) => const SizedBox(
          width: 10,
        ),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return GestureDetector(
            onDoubleTap: (){
              context.go("/allE/${popularEvents[index].name.toLowerCase()}");
            },
            onTap: (){
              context.read<EventsBloc>().add(GetAllEvents(context,popularEvents[index].name.toLowerCase()));
            },
            child: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Color(0x15FAAF00),
                border: Border.all(color: Colors.yellow.shade800),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  popularEvents[index].icon,
                  Text(popularEvents[index].name)
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
