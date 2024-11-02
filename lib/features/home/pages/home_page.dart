import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tokyo_hakkason2024_app/features/audio/audio_player.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});
  static const String routeName = '/home';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final audioPlayerNotifier = ref.read(audioPlayerNotifierProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Flutter'),
      ),
      body: Center(
        child: Column(
          children: [
            TextButton(
              onPressed: () {
                try {
                  print('play');
                  audioPlayerNotifier.play();
                } catch (e) {
                  print(e);
                }
              },
              child: const Text('焚き火'),
            ),
          ],
        ),
      ),
    );
  }
}
