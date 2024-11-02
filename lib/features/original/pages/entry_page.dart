import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:tokyo_hakkason2024_app/features/original/pages/original_page.dart';
import 'package:tokyo_hakkason2024_app/features/original/pages/privacy_policy_modal.dart';

class EntryPage extends StatelessWidget {
  const EntryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).canvasColor,
      body: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Image.asset('assets/images/entry.png'),
              ),
              FilledButton.tonal(
                onPressed: () {},
                style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(
                    Theme.of(context).primaryColor,
                  ),
                  padding: const WidgetStatePropertyAll(
                    EdgeInsets.symmetric(vertical: 14, horizontal: 44.5),
                  ),
                ),
                child: const Text('同意して始める'),
              ),
              const SizedBox(height: 24),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'プライバシーポリシー',
                      style: const TextStyle(
                        color: Colors.black,
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
                    const TextSpan(
                      text: 'に同意したものとみなします',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 42),
            ],
          ),
        ),
      ),
    );
  }
}
