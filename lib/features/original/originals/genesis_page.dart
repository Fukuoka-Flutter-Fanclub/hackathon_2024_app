import 'package:flutter/material.dart';
import 'package:tokyo_hakkason2024_app/core/utils/context_extension.dart';
import 'package:tokyo_hakkason2024_app/features/original/widgets/paper_background.dart';

class GenesisPage extends StatelessWidget {
  const GenesisPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PaperBackground(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '創世記',
              style: context.textTheme.titleMedium,
            ),
            const SizedBox(height: 16),
            Text(
              '''
神は「睡眠あれ」と言われた。すると睡眠があった。神は睡眠を見て、良しとされた。神は光の睡眠時間と闇の起床時間とを分けられた。

神は眠っている時間を昼と名づけ、起きている時間を夜と名づけられた。

第一日である。


神はまた言われた、「布団と布団の間におおぞらがあって、掛け布団と敷き布団とを分けよ」。そのようになった。神は掛け布団と敷き布団を造り、人びとはその間のおおぞらに住むようになった。

第二日である。


神はまた言われた、「頭の所に集まり、かわいた地が現れよ」。そのようになった。神はそのかわいた地を枕と名づけた。

神はまた言われた、「敷き布団の上には青草をはえさせよ」。そのようになった。神は青草をシーツと名づけた。神は見て、良しとされた。

第三日である。


神はまた言われた、「もう疲れた。休も。やっぱり週休四日こそ至高」。しかし、そのようにはならなかった。世界は未だ週休二日制に苦しんでいる。神は悲しんで、週五労働とブラック企業を滅ぼすことを約束した。

第四日である。


神はこの日、何も言われなかった。これまで造られたものを慈しみ、満ち足りた心で眺めた。良き過去を振り返ることは、良き眠りをもたらす。神は布団に包まれ、大いに休まれた。

第五日である。


黄金の週末、神は親しからぬ者どもから酒宴に誘われた。神はまた言われた、「酒宴なかれ」。そのようになった。酒宴はなくなり、神と人びとの睡眠時間は守られた。慈悲深き神は、安らかな眠りを求める人びとに、この力を分け与えようと決められた。

第六日である。


神は親しき者から酒宴に誘われた。神はまた言われた、「酒宴あれ」。そのようになった。神は酒宴を大いに楽しまれた。

神は酒宴を光の酒宴と闇の酒宴に分けた。闇の酒宴は、人も多く、騒がしく、心を乱し、眠りを妨げた。しかし、光の酒宴は、人も少なく、酒すらいらず、穏やかで、心に安らぎを与え、眠りを深めた。

神は光の酒宴で英気を養い、明日から頑張ろうと誓った。

第七日である。
                  ''',
              style: context.textTheme.labelMedium,
            ),
            Text(
              '◀︎ 教義に戻る',
              style: context.textTheme.labelMedium,
            ),
            const SizedBox(height: 42),
          ],
        ),
      ),
    );
  }
}
