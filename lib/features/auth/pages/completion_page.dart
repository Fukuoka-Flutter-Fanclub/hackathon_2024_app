import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tokyo_hakkason2024_app/core/widgets/buttons/custom_button.dart';
import 'package:tokyo_hakkason2024_app/features/home/pages/home_page.dart';

class CompletionPage extends StatefulWidget {
  const CompletionPage({super.key});
  static const String routeName = '/completion';

  @override
  State<CompletionPage> createState() => _CompletionPageState();
}

class _CompletionPageState extends State<CompletionPage> {
  final _nameController = TextEditingController();
  final _focusNode = FocusNode();
  final bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Focus(
      focusNode: _focusNode,
      child: Stack(
        children: [
          Scaffold(
            body: SafeArea(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "入信しました。",
                          style: textTheme.headlineMedium,
                        ),
                        Text(
                          "あなたまこれからすやすや教として生きていくのです。",
                          style: textTheme.labelMedium,
                        ),
                      ],
                    ),
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
                            width: 343,
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
                            padding: const EdgeInsets.only(
                                left: 16, top: 16, bottom: 16),
                            child: Column(
                              children: [
                                Text(
                                  "スヤリスト",
                                  style: textTheme.bodyLarge,
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  "s00001",
                                  style: textTheme.bodyMedium,
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    CustomButton(
                      width: 225,
                      height: 56,
                      type: ButtonType.primary,
                      text: "ホームへ",
                      textStyle: textTheme.labelLarge,
                      onPressed: () => context.go(HomePage.routeName),
                      isLoading: false,
                    ),
                  ],
                ),
              ),
            ),
          ),
          if (_isLoading)
            Container(
              color: Colors.black54,
              child: const Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              ),
            ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }
}
