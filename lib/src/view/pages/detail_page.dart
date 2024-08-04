import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:untitled/src/app/utils/utils.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          padding: EdgeInsets.only(left: 8),
          onPressed: () {
            context.go("/home");
          },
          icon: Icon(Icons.home),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Image.asset(
              "assets/img.png",
              height: 300,
            ),
          ),
          const Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Text(
              "Event Name",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Row(
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
          ),
          SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Row(
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
                  "state.events[i].eventPlace",
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(right: 30),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "Rs 40.00",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Divider(
            color: Color(0xFFB79435),
          ),
          SizedBox(
            height: 65,
          ),
          Divider(
            color: Color(0xFFB79435),
          ),
          SizedBox(
            height: 25,
          ),
          Center(
            child: Container(
              height: 60,
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                  color: Colors.red, borderRadius: BorderRadius.circular(12)),
              child: MaterialButton(
                color: const Color(0xFFF8D461),
                elevation: 0,
                onPressed: () {},
                child: const Text(
                  "Register",
                  style: TextStyle(fontSize: 26),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
