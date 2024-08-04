import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BottomBar extends StatelessWidget {
  BottomBar({super.key, this.index = 0});

  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      padding: const EdgeInsets.symmetric(horizontal: 15),
      height: 60,
      decoration: BoxDecoration(
        color: Colors.yellow.shade700,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {
              context.go("/home");
              // setState(() {
              //   widget.index = 0;
              // });
            },
            icon: Icon(
              Icons.home,
              color: index == 0 ? Colors.black : Colors.white,
            ),
          ),
          IconButton(
            onPressed: () {
              context.go("/event");
            },
            icon: Icon(
              Icons.calendar_month,
              color: index == 1 ? Colors.black : Colors.white,
            ),
          ),
          IconButton(
            onPressed: () {
              context.go("/bm");
            },
            icon: Icon(
              Icons.bookmark,
              color: index == 2 ? Colors.black : Colors.white,
            ),
          ),
          IconButton(
            onPressed: () {
              context.go("/settings");
            },
            icon: Icon(
              Icons.settings,
              color: index == 3 ? Colors.black : Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
