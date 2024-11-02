import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:tokyo_hakkason2024_app/features/home/pages/home_page.dart';

final bottomNavigationProvider =
    NotifierProvider<BottomNavigationService, StatefulNavigationShell?>(
  BottomNavigationService.new,
);

class BottomNavigationService extends Notifier<StatefulNavigationShell?> {
  @override
  StatefulNavigationShell? build() {
    return null;
  }

  void setNavigationShell(StatefulNavigationShell navigationShell) {
    if (state == navigationShell) {
      return;
    }
    state = navigationShell;
  }

  void navigation(int index) {
    if (state == null) {
      return;
    }
    state!.goBranch(
      index,
      initialLocation: index == state!.currentIndex,
    );
  }

  String analyticsScreenName() {
    final key = state?.key;
    if (key is LabeledGlobalKey) {
      final currentState = key.currentState;
      if (currentState is StatefulNavigationShellState) {
        return switch (currentState.currentIndex) {
          0 => HomePage.routeName,
          1 => HomePage.routeName,
          _ => HomePage.routeName,
        };
      }
    }
    return HomePage.routeName;
  }
}
