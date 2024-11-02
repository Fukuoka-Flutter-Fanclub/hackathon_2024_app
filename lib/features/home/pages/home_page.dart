import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:tokyo_hakkason2024_app/core/widgets/buttons/custom_button.dart';
import 'package:tokyo_hakkason2024_app/features/home/controllers/home_controller.dart';
import 'package:tokyo_hakkason2024_app/features/home/model/user_model.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});
  static const String routeName = '/home';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = Theme.of(context).textTheme;
    final userState = ref.watch(homeControllerProvider);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: userState.when(
            data: (user) {
              if (user == null) {
                return const Center(child: Text('ユーザー情報がありません'));
              }

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "おかえり、${user.nickname}",
                        style: textTheme.headlineMedium,
                      ),
                      Text(
                        "すやりすととしての活動を行いましょう",
                        style: textTheme.labelMedium,
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  _buildMembershipCard(context, user, textTheme),
                ],
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
      ),
    );
  }

  Widget _buildMembershipCard(
      BuildContext context, UserModel user, TextTheme textTheme) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
        side: const BorderSide(
          color: Colors.black,
          width: 1.0,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 188,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(4.0),
            ),
            child: const Center(
              child: Icon(
                Icons.image,
                size: 48,
                color: Colors.grey,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 8),
                Text(
                  "スヤリスト番号",
                  style: textTheme.bodyLarge,
                ),
                const SizedBox(height: 4),
                Text(
                  user.id,
                  style: textTheme.bodyMedium,
                ),
                const SizedBox(height: 16),
                Align(
                  alignment: Alignment.centerRight,
                  child: CustomButton(
                    width: 147,
                    height: 40,
                    type: ButtonType.outline,
                    text: "会員証を見せる",
                    textStyle: textTheme.labelMedium,
                    onPressed: () => context.go(HomePage.routeName),
                    isLoading: false,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
