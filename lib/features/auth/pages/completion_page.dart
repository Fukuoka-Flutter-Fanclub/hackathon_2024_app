import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tokyo_hakkason2024_app/core/widgets/buttons/custom_button.dart';
import 'package:tokyo_hakkason2024_app/features/home/pages/home_page.dart';

class CompletionPage extends StatefulWidget {
  const CompletionPage({
    super.key,
    required this.userId,
  });

  final String userId;
  static const String routeName = '/completion';

  @override
  State<CompletionPage> createState() => _CompletionPageState();
}

class _CompletionPageState extends State<CompletionPage> {
  final _focusNode = FocusNode();
  final _displayId = '';

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
                        Card(
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
                                    Text(
                                      "スヤリスト",
                                      style: textTheme.bodyLarge,
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      _displayId,
                                      style: textTheme.bodyMedium,
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
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
