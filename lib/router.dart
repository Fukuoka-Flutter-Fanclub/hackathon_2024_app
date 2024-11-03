import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:tokyo_hakkason2024_app/core/providers/supabase_provider.dart';
import 'package:tokyo_hakkason2024_app/features/auth/pages/completion_page.dart';
import 'package:tokyo_hakkason2024_app/features/auth/pages/registration_page.dart';
import 'package:tokyo_hakkason2024_app/features/chat/chat_screen.dart';
import 'package:tokyo_hakkason2024_app/features/home/pages/home_page.dart';
import 'package:tokyo_hakkason2024_app/features/original/pages/entry_page.dart';
import 'package:tokyo_hakkason2024_app/features/setting/setting_screen.dart';
import 'package:tokyo_hakkason2024_app/features/tab/tab_page.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _homeTabNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'home');
final _chatTabNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'chat');
final _settingTabNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'setting');

final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: HomePage.routeName,
    redirect: (_, state) {
      if (supabase.auth.currentUser == null &&
          state.matchedLocation == HomePage.routeName) {
        return EntryPage.routeName;
      }
      return null;
    },
    routes: [
      GoRoute(
        path: EntryPage.routeName,
        name: EntryPage.routeName,
        pageBuilder: (context, state) {
          return const MaterialPage(
            child: EntryPage(),
          );
        },
      ),
      GoRoute(
        path: RegistrationPage.routeName,
        name: RegistrationPage.routeName,
        pageBuilder: (context, state) {
          return MaterialPage(
            key: state.pageKey,
            child: const RegistrationPage(),
          );
        },
      ),
      GoRoute(
        path: CompletionPage.routeName,
        builder: (context, state) {
          final Map<String, dynamic> extra =
              state.extra as Map<String, dynamic>;
          final userId = extra['userId'] as String;
          final nickname = extra['nickname'] as String;
          return CompletionPage(userId: userId, nickname: nickname);
        },
      ),
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return HomeTabPage(navigationShell);
        },
        branches: [
          StatefulShellBranch(
            navigatorKey: _homeTabNavigatorKey,
            routes: <RouteBase>[
              GoRoute(
                name: HomePage.routeName,
                path: HomePage.routeName,
                pageBuilder: (context, state) => const MaterialPage(
                  name: HomePage.routeName,
                  child: HomePage(),
                ),
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _chatTabNavigatorKey,
            routes: <RouteBase>[
              GoRoute(
                name: ChatPage.routeName,
                path: ChatPage.routeName,
                pageBuilder: (context, state) => const MaterialPage(
                  name: ChatPage.routeName,
                  child: ChatPage(),
                ),
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _settingTabNavigatorKey,
            routes: <RouteBase>[
              GoRoute(
                name: SettingScreen.routeName,
                path: SettingScreen.routeName,
                pageBuilder: (context, state) => const MaterialPage(
                  name: SettingScreen.routeName,
                  child: SettingScreen(),
                ),
              ),
            ],
          ),
        ],
      ),
    ],
    errorPageBuilder: (context, state) => MaterialPage(
      key: state.pageKey,
      child: Scaffold(
        body: Center(
          child: Text(state.error.toString()),
        ),
      ),
    ),
  );
});
