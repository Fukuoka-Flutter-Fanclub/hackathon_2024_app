import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tokyo_hakkason2024_app/features/notification/permission.dart';
import 'package:tokyo_hakkason2024_app/features/notification/settings.dart';
import 'package:tokyo_hakkason2024_app/features/setting/setting_switch.dart';

// 実際に時刻を追加するところは技術的にもコアポイントではないため、
// デモで見せる必要がなさそうなのであらかじめ設定されたもののみ表示している
class SettingScreen extends ConsumerWidget {
  const SettingScreen({super.key});

  static const String routeName = '/setting';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('就寝設定'),
      ),
      body: const Center(
        child: Column(
          children: [
            TimeSettingMockItem(time: '19:00'),
            TimeSettingMockItem(time: '19:15'),
            TimeSettingMockItem(time: '20:00'),
            TimeSettingMockItem(time: '23:00'),
            TimeSettingMockItem(time: '23:45'),
            TimeSettingItem(time: '24:00'),
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
                requestPermissions();
                scheduleNotification();
              }
            },
          ),
        ],
      ),
    );
  }
}

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
            value: false,
            onChanged: (value) {
              print('ただのデモなので何もしない');
            },
          ),
        ],
      ),
    );
  }
}
