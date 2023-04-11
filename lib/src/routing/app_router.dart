// import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rawdah/src/features/dashboard/presentation/page_manager/page_manager_screen.dart';
import 'package:rawdah/src/features/names/domain/name.dart';
import 'package:rawdah/src/features/names/presentation/page/name_page_screen.dart';
import 'package:rawdah/src/features/names/presentation/topic/topic_screen.dart';
import 'package:rawdah/src/features/settings/presentation/main/settings_screen.dart';
import 'package:rawdah/src/features/test/presentation/test_screen.dart';

enum AppRoute {
  manager,
  splash,
  onboarding,
  auth,
  forgot,

  home,

  name,
  topic,
  test,

  settings,
}

final goRouter = GoRouter(
  initialLocation: '/manager',
  debugLogDiagnostics: false,
  routes: [
    GoRoute(
      path: '/manager',
      name: AppRoute.manager.name,
      builder: (context, state) => const PageManagerScreen(),
    ),
    GoRoute(
      path: '/name',
      name: AppRoute.name.name,
      builder: (context, state) => NamePageScreen(
        model: state.extra as Name,
      ),
    ),
    GoRoute(
      path: '/topic/:id',
      name: AppRoute.topic.name,
      builder: (context, state) {
        print(state.params['id']);
        return TopicScreen(id: state.params['id'] ?? '1');
      },
    ),
    GoRoute(
      path: '/test:id',
      name: AppRoute.test.name,
      builder: (context, state) => TestScreen(id: state.params['id'] ?? '1'),
    ),
    GoRoute(
      path: '/settings',
      name: AppRoute.settings.name,
      pageBuilder: (context, state) => MaterialPage(
        key: state.pageKey,
        fullscreenDialog: true,
        child: const SettingsScreen(),
      ),
    ),
  ],
  // errorBuilder: (context, state) => const NotFoundScreen(),
);
