import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:tokyo_hakkason2024_app/features/auth/pages/login_page.dart';
import 'package:tokyo_hakkason2024_app/features/auth/pages/signup_page.dart';
import 'package:tokyo_hakkason2024_app/features/home/pages/home_page.dart';

final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        name: 'initial',
        pageBuilder: (context, state) {
          return MaterialPage(
            key: state.pageKey,
            child: const HomePage(),
          );
        },
      ),
      GoRoute(
        path: LoginPage.routeName,
        name: LoginPage.routeName,
        pageBuilder: (context, state) {
          return MaterialPage(
            key: state.pageKey,
            child: const LoginPage(),
          );
        },
      ),
      GoRoute(
        path: SigninPage.routeName,
        name: SigninPage.routeName,
        pageBuilder: (context, state) {
          return MaterialPage(
            key: state.pageKey,
            child: const SigninPage(),
          );
        },
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
