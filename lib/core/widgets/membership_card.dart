import 'package:flutter/material.dart';
import 'package:tokyo_hakkason2024_app/core/widgets/buttons/custom_button.dart';
import 'package:tokyo_hakkason2024_app/features/home/model/user_model.dart';

class MembershipCard extends StatelessWidget {
  final UserModel user;
  final double width;
  final double height;
  final bool showButton;
  final VoidCallback? onButtonPressed;
  final TextStyle? nicknameTextStyle;
  final TextStyle? nicknameLabelStyle;
  final TextStyle? idTextStyle;
  final TextStyle? idLabelStyle;

  const MembershipCard({
    super.key,
    required this.user,
    this.width = 343.0,
    this.height = 205.0,
    this.showButton = true,
    this.onButtonPressed,
    this.nicknameTextStyle,
    this.nicknameLabelStyle,
    this.idTextStyle,
    this.idLabelStyle,
  });

  factory MembershipCard.landscape({
    required UserModel user,
    double? width,
    double? height,
    TextTheme? textTheme,
  }) {
    return MembershipCard(
      user: user,
      width: width ?? 470.0,
      height: height ?? 282.0,
      showButton: false,
      nicknameTextStyle: textTheme?.headlineSmall,
      nicknameLabelStyle: textTheme?.titleLarge?.copyWith(
        fontWeight: FontWeight.bold,
      ),
      idTextStyle: textTheme?.labelSmall,
      idLabelStyle: textTheme?.titleLarge,
    );
  }

  factory MembershipCard.portrait({
    required UserModel user,
    VoidCallback? onButtonPressed,
    bool showButton = true,
    TextTheme? textTheme,
  }) {
    return MembershipCard(
      user: user,
      width: 343.0,
      height: 205.0,
      showButton: showButton,
      onButtonPressed: onButtonPressed,
      nicknameTextStyle: textTheme?.labelLarge,
      nicknameLabelStyle: textTheme?.labelSmall,
      idTextStyle: textTheme?.labelSmall,
      idLabelStyle: textTheme?.labelLarge,
    );
  }

  @override
  Widget build(BuildContext context) {
    final cardAspectRatio = width / height;
    final textTheme = Theme.of(context).textTheme;

    return AspectRatio(
      aspectRatio: cardAspectRatio,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: width,
          maxHeight: height,
        ),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.51),
          ),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.51),
              image: const DecorationImage(
                image: AssetImage('assets/images/membership_card.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: Padding(
              padding: EdgeInsets.all(height * 0.07),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "ニックネーム",
                          style: nicknameLabelStyle,
                        ),
                        Text(
                          user.nickname,
                          style: nicknameTextStyle,
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          "スヤリスト番号",
                          style: idLabelStyle,
                        ),
                        const SizedBox(height: 4),
                        Text(
                          user.id,
                          style: idTextStyle,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                  showButton
                      ? Align(
                          alignment: Alignment.bottomRight,
                          child: CustomButton(
                            width: 147,
                            height: 40,
                            type: ButtonType.outline,
                            text: "会員証を見せる",
                            textStyle: textTheme.labelMedium,
                            onPressed: onButtonPressed,
                            isLoading: false,
                          ),
                        )
                      : const SizedBox(
                          width: 147,
                          height: 40,
                        )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
