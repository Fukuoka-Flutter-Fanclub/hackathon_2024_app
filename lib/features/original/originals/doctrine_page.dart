import 'package:flutter/material.dart';
import 'package:tokyo_hakkason2024_app/core/utils/context_extension.dart';
import 'package:tokyo_hakkason2024_app/features/original/widgets/paper_background.dart';

class DoctrinePage extends StatelessWidget {
  const DoctrinePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PaperBackground(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '●教義',
              style: context.textTheme.titleMedium,
            ),
            Text(
              '''
「ちゃんと寝ろ」
「睡眠時間を増やせ」

のみです。神聖な睡眠時間を奪うような面倒事は「宗教上の理由」で断ることができます。
              ''',
              style: context.textTheme.labelMedium,
            ),
            Text(
              '●禁忌',
              style: context.textTheme.titleMedium,
            ),
            Text(
              '''
・他者に信仰を強要すること
・金品をせびること
・悪意をもって他者の睡眠時間を奪うこと
破った場合は破門の上、罰として徹夜してください。
              ''',
              style: context.textTheme.labelMedium,
            ),
            Row(
              children: [
                const Expanded(child: SizedBox()),
                Text(
                  '創世記を見る ▶',
                  style: context.textTheme.labelMedium,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
