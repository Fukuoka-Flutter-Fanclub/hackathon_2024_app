import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tokyo_hakkason2024_app/core/widgets/buttons/custom_button.dart';
import 'package:tokyo_hakkason2024_app/core/widgets/membership_card.dart';
import 'package:tokyo_hakkason2024_app/features/home/model/user_model.dart';
import 'package:tokyo_hakkason2024_app/features/home/pages/home_page.dart';

class CompletionPage extends StatefulWidget {
  const CompletionPage({
    super.key,
    required this.userId,
    required this.nickname,
  });

  final String userId;
  final String nickname;
  static const String routeName = '/completion';

  @override
  State<CompletionPage> createState() => _CompletionPageState();
}

class _CompletionPageState extends State<CompletionPage> {
  final _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final screenHeight = MediaQuery.of(context).size.height;

    return Focus(
      focusNode: _focusNode,
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 30),
                        Text(
                          "入信しました。",
                          style: textTheme.headlineMedium,
                        ),
                        Text(
                          "あなたはこれからスヤスヤ教として生きていくのです。",
                          style: textTheme.labelMedium,
                        ),
                        SizedBox(height: screenHeight * 0.05),
                        MembershipCard.portrait(
                          user: UserModel(
                              id: widget.userId, nickname: widget.nickname),
                          textTheme: textTheme,
                          showButton: false,
                        ),
                        SizedBox(height: screenHeight * 0.05),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 24),
                  child: CustomButton(
                    width: 225,
                    height: 56,
                    type: ButtonType.primary,
                    text: "ホームへ",
                    textStyle: textTheme.labelLarge,
                    onPressed: () => context.go(HomePage.routeName),
                    isLoading: false,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }
}
