import 'package:flutter/material.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tokyo_hakkason2024_app/core/utils/my_colors.dart';
import 'package:tokyo_hakkason2024_app/core/utils/theme.dart';
import 'package:tokyo_hakkason2024_app/features/chat/chat_controller_provider.dart';
import 'package:tokyo_hakkason2024_app/features/chat/message_provider.dart';

class ChatScreen extends ConsumerStatefulWidget {
  const ChatScreen({super.key});

  static const String routeName = '/chat';

  @override
  ConsumerState<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends ConsumerState<ChatScreen> {
  final user = const types.User(id: 'user');
  final bot = const types.User(id: 'bot', firstName: 'ChatGPT');

  @override
  Widget build(BuildContext context) {
    final messages = ref.watch(messagesProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('神に相談'),
      ),
      body: Theme(
        data: ThemeData(
            inputDecorationTheme: const InputDecorationTheme(),
            textTheme: ref.read(themeProvider).textTheme),
        child: Chat(
          messages: messages.reversed.toList(),
          onSendPressed: _handleSendPressed,
          user: user,
          theme: DefaultChatTheme(
            primaryColor: Colors.blue,
            backgroundColor: Colors.white,
            inputBackgroundColor: Colors.grey[200]!,
            inputTextColor: MyColors.black.color,
          ),
        ),
      ),
    );
  }

  void _handleSendPressed(types.PartialText message) {
    ref.read(chatControllerProvider.notifier).sendMessage(
          user,
          bot,
          message.text,
        );
  }
}
