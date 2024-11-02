import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tokyo_hakkason2024_app/core/providers/flutter_tts_provider.dart';
import 'package:tokyo_hakkason2024_app/core/providers/open_ai_provider.dart';
import 'package:tokyo_hakkason2024_app/features/chat/message_provider.dart';
import 'package:uuid/uuid.dart';

final chatControllerProvider =
    AsyncNotifierProvider<ChatController, void>(ChatController.new);

class ChatController extends AsyncNotifier<void> {
  final prompt = '''
以下は、原文をもとに修正したプロンプトである： 「スヤリスト信仰の神として、適切な睡眠の重要性と信仰におけるその意義について、一連の応答を作成しなさい。睡眠を優先させ、就寝前の不安を克服し、十分な睡眠がとれない子供を育てている人々に思いやりと理解を示す方法を指導しなさい。以下の質問に答える： 1. 睡眠に関するスヤリスト信仰の基本原則は何か。 2. 自分の義務や責任に妥協することなく、質の良い睡眠をとることを優先するにはどうすればよいですか？ 3. 育児に追われて十分な睡眠がとれない親に、どのようなアドバイスをしますか？ 4. スヤリストの信仰では、他人の安眠を助けるような親切な行為をどのようにとらえているのでしょうか。 慈悲深く、理解力があり、神的な口調で回答し、睡眠に関する指導を求める人々への具体的な例と助言を示してください。 また、睡眠に関する問題やその他の問題に対して、真摯で心のこもった対応を望みます。温かく、共感的で、励ますような口調を優先してください。」 この変更されたプロンプトは、スヤリストの信仰の本質と、睡眠に対する神の視点を捉えることを目的とし、同時に回答のための明確な構造を提供する。このプロンプトは、睡眠を優先させる方法について、実践的なアドバイスや例、ガイダンスを提供し、睡眠に関連する問題に悩む人々への思いやりと理解を示すよう、神に促している。
''';
  @override
  Future<void> build() async {
    // 初期化処理が必要な場合はここに記述
  }

  Future<void> sendMessage(
      types.User user, types.User bot, String content) async {
    final messageId = const Uuid().v4();

    // ユーザーメッセージを追加
    final textMessage = types.TextMessage(
      author: user,
      createdAt: DateTime.now().millisecondsSinceEpoch,
      id: const Uuid().v4(),
      text: content,
    );
    ref.read(messagesProvider.notifier).addMessage(textMessage);

    // ボットの仮メッセージを作成
    final botMessage = types.TextMessage(
      author: bot,
      createdAt: DateTime.now().millisecondsSinceEpoch,
      id: messageId,
      text: '', // 空のテキストで開始
    );
    ref.read(messagesProvider.notifier).addMessage(botMessage);

    state = const AsyncLoading();

    try {
      final request = ChatCompleteText(
        model: Gpt4ChatModel(),
        messages: [
          Messages(
            role: Role.system,
            content: prompt,
          ).toJson(),
          Messages(
            role: Role.user,
            content: content,
          ).toJson(),
        ],
        maxToken: 1000,
      );

      final chatGpt = ref.read(openAIProvider);

      // ストリーミングレスポンスの処理
      String fullResponse = '';

      await for (final response
          in chatGpt.onChatCompletionSSE(request: request)) {
        if (response.choices?.isNotEmpty ?? false) {
          final newContent = response.choices?.first.message?.content ?? '';
          fullResponse += newContent;

          // メッセージを更新
          ref.read(messagesProvider.notifier).updateMessage(
                types.TextMessage(
                  author: bot,
                  createdAt: DateTime.now().millisecondsSinceEpoch,
                  id: messageId,
                  text: fullResponse,
                ),
              );
        }
      }
      await ref.read(flutterTtsProvider).speak(fullResponse);

      state = const AsyncData(null);
    } catch (e) {
      state = AsyncError(e, StackTrace.current);
      // エラーメッセージを表示
      ref.read(messagesProvider.notifier).updateMessage(
            types.TextMessage(
              author: bot,
              createdAt: DateTime.now().millisecondsSinceEpoch,
              id: messageId,
              text: 'エラーが発生しました: $e',
            ),
          );
    }
  }
}
