import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:tokyo_hakkason2024_app/features/tab/bottom_navigation_provider.dart';

class HomeTabPage extends ConsumerStatefulWidget {
  const HomeTabPage(this.navigationShell, {super.key});
  final StatefulNavigationShell navigationShell;

  @override
  ConsumerState<HomeTabPage> createState() => _HomeTabPageState();
}

class _HomeTabPageState extends ConsumerState<HomeTabPage> {
  StatefulNavigationShell get navigationShell => widget.navigationShell;
  int get _currentIndex => navigationShell.currentIndex;
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref
          .read(bottomNavigationProvider.notifier)
          .setNavigationShell(navigationShell);
    });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      body: navigationShell,
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        currentIndex: _currentIndex,
        enableFeedback: true,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.stars),
            label: 'ホーム',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.stars),
            label: '神に相談',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.stars),
            label: '就寝設定',
          ),
        ],
        onTap: (index) {
          HapticFeedback.heavyImpact();
          ref.read(bottomNavigationProvider.notifier).navigation(index);
        },
      ),
    );
  }
}
