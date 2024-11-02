import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tokyo_hakkason2024_app/core/constants/env_constants.dart';

final openAIProvider = Provider<OpenAI>((ref) {
  final openAI = OpenAI.instance.build(
    token: EnvConstants().chatGptApiKey,
    baseOption: HttpSetup(receiveTimeout: const Duration(seconds: 30)),
    enableLog: true,
  );
  return openAI;
});
