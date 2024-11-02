import 'package:flutter/material.dart';
import 'package:tokyo_hakkason2024_app/features/original/originals/doctrine_page.dart';
import 'package:tokyo_hakkason2024_app/features/original/originals/genesis_page.dart';
import 'package:turn_page_transition/turn_page_transition.dart';

class OriginalPage extends StatefulWidget {
  const OriginalPage({super.key});

  static const List<Widget> pages = [
    DoctrinePage(),
    GenesisPage(),
  ];

  @override
  State<OriginalPage> createState() => _OriginalPageState();
}

class _OriginalPageState extends State<OriginalPage> {
  TurnPageController? controller;

  @override
  void initState() {
    super.initState();
    controller = TurnPageController();
  }

  @override
  void dispose() {
    super.dispose();
    controller = null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TurnPageView.builder(
        itemCount: OriginalPage.pages.length,
        controller: controller,
        itemBuilder: (_, index) {
          return OriginalPage.pages[index];
        },
      ),
    );
  }
}
