import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tokyo_hakkason2024_app/features/notification/permission.dart';
import 'package:tokyo_hakkason2024_app/features/notification/settings.dart';
import 'package:tokyo_hakkason2024_app/features/setting/audio_button.dart';
import 'package:tokyo_hakkason2024_app/features/setting/audio_player.dart';
import 'package:tokyo_hakkason2024_app/features/setting/setting_switch.dart';
import 'package:tokyo_hakkason2024_app/features/setting/setting_switch_mock.dart';

// 実際に時刻を追加するところは技術的にもコアポイントではないため、
// デモで見せる必要がなさそうなのであらかじめ設定されたもののみ表示している
class SettingScreen extends ConsumerWidget {
  const SettingScreen({super.key});

  static const String routeName = '/setting';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final audioPlayerNotifier = ref.read(audioPlayerNotifierProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('就寝設定'),
      ),
      body: Center(
        child: Column(
          children: [
            const TimeSettingMockItem(time: '19:00'),
            const TimeSettingMockItem(time: '19:15'),
            const TimeSettingMockItem(time: '20:00'),
            const TimeSettingMockItem(time: '23:00'),
            const TimeSettingMockItem(time: '23:45'),
            const TimeSettingItem(time: '24:00'),
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
              playMethod: () async {
                final AudioPlayer audioPlayer = AudioPlayer();
                await audioPlayer.setSource(AssetSource("audio/stream.mp3"));
                await audioPlayer.resume();
              },
              text: '川のせせらぎ',
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

class TimeSettingItem extends ConsumerWidget {
  const TimeSettingItem({super.key, required this.time});

  final String time;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(time),
          CupertinoSwitch(
            value: ref.watch(settingSwitchProvider),
            onChanged: (value) {
              ref.read(settingSwitchProvider.notifier).changeBool();
              if (value) {
                scheduleNotification();
              }
            },
          ),
        ],
      ),
    );
  }
}

// 24:00の設定のみをデモで表示させるため、他はいったん適当に作っている
// （というか同時に動くからほんとはこれもいらないまである）
class TimeSettingMockItem extends ConsumerWidget {
  const TimeSettingMockItem({super.key, required this.time});

  final String time;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(time),
          CupertinoSwitch(
            value: ref.watch(settingSwitchMockProvider),
            onChanged: (value) {
              ref.read(settingSwitchMockProvider.notifier).changeBool();
              if (value) {
                print("モックアイテム");
              }
            },
          ),
        ],
      ),
    );
  }
}
