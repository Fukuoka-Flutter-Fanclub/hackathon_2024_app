import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AudioButton extends ConsumerWidget {
  const AudioButton({
    super.key,
    required this.playMethod,
    required this.text,
  });
  final void Function() playMethod;
  final String text;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TextButton(
      onPressed: () {
        try {
          playMethod();
        } catch (e) {
          print(e);
        }
      },
      child: Text(text),
    );
  }
}
