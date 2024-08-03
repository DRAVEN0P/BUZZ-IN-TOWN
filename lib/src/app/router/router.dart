import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:untitled/src/view/pages/all_events.dart';
import 'package:untitled/src/view/pages/home_page.dart';
import 'package:untitled/src/view/pages/maps.dart';

final router = GoRouter(
  initialLocation: '/home',
  routes: <GoRoute>[
    GoRoute(
      path: '/',
      pageBuilder: (context, state) =>
      const MaterialPage(child: SizedBox.shrink()),
    ),
    GoRoute(
      path: '/home',
      pageBuilder: (context, state) =>
      const MaterialPage(child: Scaffold(body: HomePage())),
    ),
    GoRoute(
      path: '/allE/:path',
      pageBuilder: (context, state) {
        final eventId = state.pathParameters["path"]!;
        return MaterialPage(child: Scaffold(body: AllEvents(path: eventId,)));
      },
    ),
    GoRoute(
      path: '/map',
      pageBuilder: (context, state) {
        // final eventId = state.pathParameters["path"]!;
        return MaterialPage(child: Maps());
      },
    ),
  ],
);

