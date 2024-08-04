import 'package:flutter/material.dart';
import 'package:untitled/src/app/api/api.dart';
import 'package:untitled/src/app/model/event.dart';
import 'package:untitled/src/view/widgets/bottom_bar.dart';
import 'package:untitled/src/view/widgets/events_card.dart';
import 'package:untitled/src/view/widgets/popular_events.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFFCEBC4),
        leadingWidth: 200,
        leading: Row(
          children: [
            Container(
              margin: const EdgeInsets.only(left: 20, bottom: 10),
              width: 50,
              height: 50,
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3), // Shadow color
                    spreadRadius: 2, // Spread radius
                    blurRadius: 6, // Blur radius
                    offset: const Offset(3, 3), // Offset in x and y direction
                  ),
                ],
              ),
              child: Image.asset(
                'assets/background.png',
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            const Text(
              "Hi! Mr XYZ",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {
            },
            icon: const Icon(
              Icons.notifications_none,
              size: 26,
            ),
          )
        ],
      ),
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Stack(
                    children: [
                      ClipRect(
                        child: Align(
                          alignment: Alignment.topCenter,
                          // Align to top, change to center, bottom as needed

                          heightFactor: 0.65,
                          // This
                          child: Image.asset(
                            'assets/background.png',
                          ),
                        ),
                      ),
                      const Positioned(
                        left: 20,
                        top: 5,
                        child: const Text(
                          "Find Events",
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      const Positioned(
                        left: 20,
                        top: 35,
                        child: const Text(
                          "near you",
                          style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.only(left: 12, top: 35),
                child: Text(
                  "Nearby Events",
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                ),
              ),
              PopularEvents(),
              // SizedBox(height: 10,),
              const EventsCard(),
            ],
          ),
          Positioned(
            left: 40,
            top: 150,
            child: Container(
              width: 300,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),
              child: const TextField(
                // textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18),
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.only(
                    top: 12,
                  ),
                  hintText: "Search...",
                  prefixIcon: const Icon(Icons.search),
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                ),
              ),
            ),
          ),
          Positioned(
            left: 10,
            right: 10,
            bottom: 50,
            child: BottomBar(index: 0,),
          ),
        ],
      ),
    );
  }
}
