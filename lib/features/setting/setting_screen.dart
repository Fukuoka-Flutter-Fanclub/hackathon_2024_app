import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tokyo_hakkason2024_app/features/notification/permission.dart';
import 'package:tokyo_hakkason2024_app/features/notification/settings.dart';
import 'package:tokyo_hakkason2024_app/features/setting/audio_button.dart';
import 'package:tokyo_hakkason2024_app/features/setting/audio_player.dart';

class SettingScreen extends ConsumerWidget {
  const SettingScreen({super.key});

  static const String routeName = '/setting';

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
            AudioButton(
              playMethod: audioPlayerNotifier.playFire,
              text: '焚き火',
            ),
            AudioButton(
              playMethod: audioPlayerNotifier.playRain,
              text: '雨',
            ),
            AudioButton(
              playMethod: audioPlayerNotifier.playRipple,
              text: '波',
            ),
            AudioButton(
              playMethod: audioPlayerNotifier.playStream,
              text: '川のせせらぎ',
            ),
            TextButton(
              onPressed: () async {
                await requestPermissions();
                await showNotification();
              },
              child: const Text('通知させる'),
            ),
            TextButton(
              onPressed: () async {
                await requestPermissions();
                await scheduleNotification();
              },
              child: const Text('スケジュールして通知させる'),
            ),
          ],
        ),
      ),
    );
  }
}
