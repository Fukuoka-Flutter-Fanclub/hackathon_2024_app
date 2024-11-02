import 'package:flutter/material.dart';
import 'package:tokyo_hakkason2024_app/features/original/pages/original_page.dart';

class PrivacyPolicyModal extends StatelessWidget {
  const PrivacyPolicyModal({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const SizedBox(),
        leadingWidth: 10,
        title: const Text('原典'),
        // title: Row(
        //   children: [
        //     Expanded(
        //       child: Expanded(
        //         child: Center(child: Text('原典')),
        //       ),
        //     ),
        //   ],
        // ),
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
