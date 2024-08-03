import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:untitled/src/view/widgets/events_card.dart';

class AllEvents extends StatelessWidget {
  const AllEvents({super.key, required this.path});
  final String path;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      context.go("/home");
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                    ),
                  ),
                  const Text(
                    "All Events",
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      "Filter",
                      style: TextStyle(fontSize: 16),
                    ),
                  )
                ],
              ),
              EventsCard(
                height: 670,
                path: path,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
