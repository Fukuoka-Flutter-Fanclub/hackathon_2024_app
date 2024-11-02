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

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 38),
          child: Row(
            children: [
              Flexible(
                flex: 65,
                child: SingleChildScrollView(
                  child: Center(
                    child: MembershipCard.landscape(
                      user: widget.user,
                      textTheme: textTheme,
                    ),
                  ),
                ),
              ),
              Flexible(
                flex: 35,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 27),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "スヤリストとは",
                              style: textTheme.labelSmall,
                            ),
                            const SizedBox(height: 16),
                            Text(
                              "スヤスヤ教を信じる人たちである。",
                              style: textTheme.labelSmall,
                            ),
                            const SizedBox(height: 16),
                            Text(
                              "教義",
                              style: textTheme.labelSmall,
                            ),
                            const SizedBox(height: 8),
                            Text(
                              "「ちゃんと寝ろ」\n「睡眠時間を増やせ」",
                              style: textTheme.labelSmall,
                            ),
                            const SizedBox(height: 16),
                            Text(
                              "神聖な睡眠時間を奪うような面倒事は断る場合がございます。",
                              style: textTheme.labelSmall,
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: CustomButton(
                            width: 56,
                            height: 112,
                            type: ButtonType.outline,
                            text: "閉じる",
                            textStyle: textTheme.labelLarge,
                            onPressed: () async {
                              await SystemChrome.setPreferredOrientations([
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}