import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:untitled/src/view/pages/all_view.dart';
import 'package:untitled/src/view/pages/bookmark_page.dart';
import 'package:untitled/src/view/pages/create_events.dart';
import 'package:untitled/src/view/pages/detail_page.dart';
import 'package:untitled/src/view/pages/event_page.dart';
import 'package:untitled/src/view/pages/home_page.dart';
import 'package:untitled/src/view/pages/maps.dart';
import 'package:untitled/src/view/pages/setting_page.dart';
import 'package:untitled/src/view/widgets/get_location.dart';

final router = GoRouter(
  initialLocation: '/crE',
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
        return MaterialPage(child: Scaffold(body: AllView(path: eventId,)));
      },
    ),
    GoRoute(
      path: '/map',
      pageBuilder: (context, state) {
        // final eventId = state.pathParameters["path"]!;
        return const MaterialPage(child: Maps());
      },
    ),
    GoRoute(
      path: '/event',
      pageBuilder: (context, state) {
        // final eventId = state.pathParameters["path"]!;
        return const MaterialPage(child: EventPage());
      },
    ),
    GoRoute(
      path: '/bm',
      pageBuilder: (context, state) {
        // final eventId = state.pathParameters["path"]!;
        return const MaterialPage(child: BookmarkPage());
      },
    ),
    GoRoute(
      path: '/settings',
      pageBuilder: (context, state) {
        // final eventId = state.pathParameters["path"]!;
        return const MaterialPage(child: SettingPage());
      },
    ),
    GoRoute(
      path: '/detail',
      pageBuilder: (context, state) {
        // final eventId = state.pathParameters["path"]!;
        return const MaterialPage(child: DetailPage());
      },
    ),
    GoRoute(
      path: '/crE',
      pageBuilder: (context, state) {
        // final eventId = state.pathParameters["path"]!;
        return const MaterialPage(child: CreateEvents());
      },
    ),
    GoRoute(
      path: '/getLoc',
      pageBuilder: (context, state) {
        // final eventId = state.pathParameters["path"]!;
        return const MaterialPage(child: GetLocation());
      },
    ),
  ],
);

