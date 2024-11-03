import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tokyo_hakkason2024_app/core/widgets/membership_card.dart';
import 'package:tokyo_hakkason2024_app/features/home/controllers/home_controller.dart';
import 'package:tokyo_hakkason2024_app/features/home/model/user_model.dart';
import 'package:tokyo_hakkason2024_app/features/home/widgets/membership_card_sheet.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});
  static const String routeName = '/home';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = Theme.of(context).textTheme;
    final userState = ref.watch(homeControllerProvider);

    return Scaffold(
      body: SafeArea(
        child: userState.when(
          data: (user) {
            if (user == null) {
              return const Center(child: Text('ユーザー情報がありません'));
            }
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "おかえり、${user.nickname}",
                          style: textTheme.headlineMedium,
                          softWrap: true,
                          overflow: TextOverflow.visible,
                        ),
                        Text(
                          "すやりすととしての活動を行いましょう",
                          style: textTheme.labelMedium,
                          softWrap: true,
                          overflow: TextOverflow.visible,
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    _buildMembershipCard(context, user, textTheme),
                    const SizedBox(height: 50),
                    Align(
                      alignment: Alignment.center,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Image.asset(
                            'assets/images/Vector.png',
                            fit: BoxFit.contain,
                          ),
                          Image.asset(
                            'assets/images/text.png',
                            fit: BoxFit.contain,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          },
          loading: () => const Center(
            child: CircularProgressIndicator(),
          ),
          error: (error, stack) => Center(
            child: Text('エラーが発生しました: $error'),
          ),
        ),
      ),
    );
  }

  Widget _buildMembershipCard(
      BuildContext context, UserModel user, TextTheme textTheme) {
    return MembershipCard.portrait(
      user: user,
      onButtonPressed: () {
        Navigator.of(context, rootNavigator: true).push(
          PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                MembershipCardSheet(user: user),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return FadeTransition(
                opacity: animation,
                child: child,
              );
            },
            fullscreenDialog: true,
            opaque: true,
          ),
        );
      },
      textTheme: textTheme,
    );
  }
}
