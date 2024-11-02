import 'package:flutter/material.dart';
import 'package:tokyo_hakkason2024_app/features/original/originals/doctrine_page.dart';
import 'package:tokyo_hakkason2024_app/features/original/originals/genesis_page.dart';
import 'package:turn_page_transition/turn_page_transition.dart';

class OriginalPage extends StatelessWidget {
  const OriginalPage({super.key});

  static const List<Widget> pages = [
    DoctrinePage(),
    GenesisPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TurnPageView.builder(
        itemCount: pages.length,
        itemBuilder: (_, index) {
          return pages[index];
        },
      ),
    );
  }
}
