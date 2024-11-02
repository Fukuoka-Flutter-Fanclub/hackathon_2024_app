import 'package:flutter/material.dart';
import 'package:tokyo_hakkason2024_app/features/original/widgets/paper_background.dart';

class DoctrinePage extends StatelessWidget {
  const DoctrinePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: PaperBackground(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '●教義',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '''
「ちゃんと寝ろ」
「睡眠時間を増やせ」

のみです。神聖な睡眠時間を奪うような面倒事は「宗教上の理由」で断ることができます。
              ''',
            ),
            Text(
              '●禁忌',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '''
・他者に信仰を強要すること
・金品をせびること
・悪意をもって他者の睡眠時間を奪うこと
破った場合は破門の上、罰として徹夜してください。
              ''',
            ),
            Row(
              children: [
                Expanded(child: SizedBox()),
                Text('創世記を見る ▶')
              ],
            ),
          ],
        ),
      ),
    );
  }
}
