// lib/app_router.dart

import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:my_personal_app/views/home_page.dart';
import 'package:my_personal_app/views/detail_page.dart';
import 'package:my_personal_app/views/github_page.dart'; // НОВИЙ ІМПОРТ

final GoRouter appRouter = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const HomePage();
      },
    ),
    GoRoute(
      path: '/detail/:id', 
      builder: (BuildContext context, GoRouterState state) {
        final profileId = state.pathParameters['id'];
        if (profileId == null) {
          return const Text("Error: Profile ID not found"); 
        }
        return DetailPage(profileId: profileId);
      },
    ),
    // НОВИЙ МАРШРУТ ДЛЯ GITHUB
    GoRoute(
      path: '/github-stats',
      builder: (BuildContext context, GoRouterState state) {
        return const GitHubPage();
      },
    ),
  ],
);