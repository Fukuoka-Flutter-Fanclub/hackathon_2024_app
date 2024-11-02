import 'package:flutter/material.dart';

class NextPageButton extends StatelessWidget {
  const NextPageButton({super.key, required this.onTapped});

  final void Function() onTapped;

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onTapped,
        child: const Text('次へ'),
    );
  }
}
