import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:tokyo_hakkason2024_app/core/providers/supabase_provider.dart';
import 'package:tokyo_hakkason2024_app/features/auth/pages/completion_page.dart';
import 'package:tokyo_hakkason2024_app/features/auth/pages/registration_page.dart';
import 'package:tokyo_hakkason2024_app/features/home/pages/home_page.dart';

final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: HomePage.routeName,
    redirect: (_, state) {
      if (supabase.auth.currentUser == null &&
          state.matchedLocation == HomePage.routeName) {
        return RegistrationPage.routeName;
      }
      return null;
    },
    routes: [
      GoRoute(
        path: HomePage.routeName,
        name: HomePage.routeName,
        pageBuilder: (context, state) {
          return MaterialPage(
            key: state.pageKey,
            child: const HomePage(),
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
          pageBuilder: (context, state) {
            return MaterialPage(
              key: state.pageKey,
              child: const CompletionPage(),
            );
          }),
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
