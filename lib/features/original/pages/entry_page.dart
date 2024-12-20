import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tokyo_hakkason2024_app/core/utils/context_extension.dart';
import 'package:tokyo_hakkason2024_app/features/auth/pages/registration_page.dart';
import 'package:tokyo_hakkason2024_app/features/original/pages/privacy_policy_modal.dart';

class EntryPage extends StatelessWidget {
  static const String routeName = '/entry';

  const EntryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/entry_page_background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 80,
                      ),
                      SizedBox(
                        width: 200,
                        height: 200,
                        child: Image.asset(
                          'assets/images/entry.png',
                          fit: BoxFit.contain,
                        ),
                      ),
                      Text('スヤスヤ教へようこそ', style: context.titleLarge),
                    ],
                  ),
                ),
                FilledButton.tonal(
                  onPressed: () {
                    context.go(RegistrationPage.routeName);
                  },
                  style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(
                      Theme.of(context).primaryColor,
                    ),
                    padding: const WidgetStatePropertyAll(
                      EdgeInsets.symmetric(vertical: 14, horizontal: 44.5),
                    ),
                  ),
                  child: Text(
                    '同意して始める',
                    style: context.labelLarge?.apply(color: Colors.white),
                  ),
                ),
                const SizedBox(height: 24),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'プライバシーポリシー',
                        style: context.textTheme.labelSmall?.apply(
                          decoration: TextDecoration.underline,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) {
                                return const PrivacyPolicyModal();
                              },
                              fullscreenDialog: true,
                            ));
                          },
                      ),
                      TextSpan(
                        text: 'に同意したものとみなします',
                        style: context.textTheme.labelSmall,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 42),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
