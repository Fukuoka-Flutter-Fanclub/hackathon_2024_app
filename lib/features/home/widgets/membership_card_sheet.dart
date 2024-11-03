import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tokyo_hakkason2024_app/core/widgets/buttons/custom_button.dart';
import 'package:tokyo_hakkason2024_app/core/widgets/membership_card.dart';
import 'package:tokyo_hakkason2024_app/features/home/model/user_model.dart';

class MembershipCardSheet extends StatefulWidget {
  final UserModel user;

  const MembershipCardSheet({
    super.key,
    required this.user,
  });

  @override
  State<MembershipCardSheet> createState() => _MembershipCardSheetState();
}

class _MembershipCardSheetState extends State<MembershipCardSheet> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
  }

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;
    final safePadding = MediaQuery.of(context).padding;
    final safeWidth = size.width - safePadding.left - safePadding.right;

    return OrientationBuilder(
      builder: (context, orientation) {
        if (orientation == Orientation.portrait) {
          // 縦向きの場合、回転を促すメッセージを表示
          return const SizedBox.shrink();
        }

        // 横向きの場合、元のコンテンツを表示
        return Container(
          width: size.width,
          height: size.height,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/membership_card_background.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: SafeArea(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 16,
                      horizontal: 16,
                    ),
                    child: SizedBox(
                      width: safeWidth,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 70,
                            child: Center(
                              child: SizedBox(
                                width: safeWidth,
                                // height: (safeWidth * 282) / 700,
                                child: MembershipCard.landscape(
                                  user: widget.user,
                                  textTheme: textTheme,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 30,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "スヤリストとは",
                                        style: textTheme.labelSmall,
                                        overflow: TextOverflow.visible,
                                      ),
                                      const SizedBox(height: 12),
                                      Text(
                                        "スヤスヤ教を信じる人たちである。",
                                        style: textTheme.labelSmall,
                                        overflow: TextOverflow.visible,
                                      ),
                                      const SizedBox(height: 12),
                                      Text(
                                        "教義",
                                        style: textTheme.labelSmall,
                                        overflow: TextOverflow.visible,
                                      ),
                                      const SizedBox(height: 8),
                                      Text(
                                        "「ちゃんと寝ろ」\n「睡眠時間を増やせ」",
                                        style: textTheme.labelSmall,
                                        overflow: TextOverflow.visible,
                                      ),
                                      const SizedBox(height: 12),
                                      Text(
                                        "神聖な睡眠時間を奪うような面倒事は断る場合がございます。",
                                        style: textTheme.labelSmall,
                                        overflow: TextOverflow.visible,
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 16),
                                  Align(
                                    alignment: Alignment.bottomRight,
                                    child: CustomButton(
                                      width: 56,
                                      height: 96,
                                      type: ButtonType.outline,
                                      text: "閉じる",
                                      textStyle: textTheme.labelLarge,
                                      onPressed: () async {
                                        await SystemChrome
                                            .setPreferredOrientations([
                                          DeviceOrientation.portraitUp,
                                        ]);
                                        if (context.mounted) {
                                          Navigator.pop(context);
                                        }
                                      },
                                      isLoading: false,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
