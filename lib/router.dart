import 'package:finice/models/category_model.dart';
import 'package:finice/views/main_scaffold_shell.dart';
import 'package:finice/views/pages/activity_page.dart';
import 'package:finice/views/pages/add_activity_page.dart';
import 'package:finice/views/pages/add_category_page.dart';
import 'package:finice/views/pages/category_page.dart';
import 'package:finice/views/pages/edit_category_page.dart';
import 'package:finice/views/pages/home_page.dart';
import 'package:finice/views/pages/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();

final router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/dashboard',
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return Mainscaffoldshell(navigationShell: navigationShell);
      },
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/dashboard',
              name: 'dashboard',
              builder: (context, state) => const HomePage(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/activity',
              name: 'activity',
              builder: (context, state) => const ActivityPage(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/category',
              name: 'category',
              builder: (context, state) => const CategoryPage(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/profile',
              name: 'profile',
              builder: (context, state) => const ProfilePage(),
            ),
          ],
        ),
      ],
    ),

    GoRoute(
      path: '/add-activity',
      name: 'add_activity',
      parentNavigatorKey: _rootNavigatorKey,
      builder: (context, state) => AddActivityPage(),
    ),
    GoRoute(
      path: '/add-category',
      name: 'add_category',
      builder: (context, state) => AddCategoryPage(),
    ),
    GoRoute(
      path: '/edit-category',
      name: 'edit_category',
      builder: (context, state) {
        if (state.extra == null) {
          return Scaffold(body: Center(child: Text("Data tidak ditemukan")));
        }

        final category = state.extra as CategoryModel;
        return EditCategoryPage(category: category);
      },
    ),
  ],
);
