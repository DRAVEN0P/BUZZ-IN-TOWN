import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:untitled/src/app/utils/utils.dart';

class UpcomingEventCard extends StatelessWidget {
  const UpcomingEventCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      padding: const EdgeInsets.only(left: 12, top: 8),
      width: double.infinity,
      height: 120,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.green,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "City Sports Festival",
            style: const TextStyle(
                fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            children: [
              const Icon(Icons.calendar_month),
              const SizedBox(
                width: 5,
              ),
              Text(
                Utils.formatData("2024-08-15T17:00:00Z"),
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
              const Icon(Icons.access_time_outlined),
              Text(
                " ${Utils.formatTime("2024-08-15T17:00:00Z")} PM",
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            children: [
              InkWell(
                onTap: () {
                  context.go("/map");
                },
                child: const Icon(Icons.location_on_outlined),
              ),
              const SizedBox(
                width: 5,
              ),
              const Text(
                maxLines: 3,
                "Downtown Park",
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.only(right: 20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "Free",
                  style: TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
