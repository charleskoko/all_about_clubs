import 'dart:convert';

import 'package:all_about_clubs/clubs/domain/club.dart';
import 'package:all_about_clubs/clubs/infrastructure/providers.dart';
import 'package:all_about_clubs/clubs/presentation/club_details_page.dart';
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
        routes: [
          GoRoute(
            name: 'details',
            path: ':id',
            pageBuilder: (context, state) {
              Club club = Club.fromJson(jsonDecode(state.params['id']!));
              return MaterialPage(
                key: state.pageKey,
                child:  ClubDetailsPage(
                  club: club,
                ),
              );
            },
          ),
        ],
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
