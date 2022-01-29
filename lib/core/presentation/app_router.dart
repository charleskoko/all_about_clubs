import 'package:all_about_clubs/clubs/presentation/clubs_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static final router = GoRouter(
    initialLocation: '/clubs',
    routes: [
      GoRoute(
        name: 'clubs',
        path: '/clubs',
        pageBuilder: (context, state) => MaterialPage(
          key: state.pageKey,
          child: const ClubsPage(),
        ),
      ),
    ],
    errorPageBuilder: (context, state) => MaterialPage(
      key: state.pageKey,
      child: const Scaffold(
          body: Center(
        child: Text(
          "Error page",
        ),
      )),
    ),
  );
}
