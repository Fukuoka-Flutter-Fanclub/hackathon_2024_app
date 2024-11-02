import 'package:flutter/material.dart';
import 'package:tokyo_hakkason2024_app/core/utils/context_extension.dart';
import 'package:tokyo_hakkason2024_app/features/original/pages/original_page.dart';

class PrivacyPolicyModal extends StatelessWidget {
  const PrivacyPolicyModal({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const SizedBox.shrink(),
        leadingWidth: 10,
        foregroundColor: Colors.black,
        title: Text(
          '原典',
          style: context.textTheme.titleLarge,
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.close),
          ),
        ],
      ),
      body: OriginalPage(),
    );
  }
}
