import 'package:flutter/material.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tokyo_hakkason2024_app/core/utils/my_colors.dart';
import 'package:tokyo_hakkason2024_app/core/utils/theme.dart';
import 'package:tokyo_hakkason2024_app/features/chat/chat_controller_provider.dart';
import 'package:tokyo_hakkason2024_app/features/chat/message_provider.dart';

class ChatPage extends ConsumerStatefulWidget {
  const ChatPage({super.key});

  static const String routeName = '/chat';

  @override
  ConsumerState<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends ConsumerState<ChatPage> {
  final user = const types.User(id: 'user');
  final bot = const types.User(id: 'bot', firstName: 'ChatGPT');

  @override
  Widget build(BuildContext context) {
    final messages = ref.watch(messagesProvider);

    return Scaffold(
      body: Theme(
        data: ThemeData(
            inputDecorationTheme: const InputDecorationTheme(),
            textTheme: ref.read(themeProvider).textTheme),
        child: Chat(
          messages: messages,
          onSendPressed: _handleSendPressed,
          user: user,
          avatarBuilder: (author) {
            if (author.id == 'bot') {
              return Container(
                margin: const EdgeInsets.only(right: 4),
                width: 24,
                height: 24,
                child: ClipOval(child: Image.asset('assets/images/icon.png')),
              );
            }
            return const SizedBox.shrink();
          },
          showUserAvatars: true,
          theme: DefaultChatTheme(
            sendButtonIcon: SizedBox(
                width: 36,
                height: 36,
                child: Image.asset('assets/images/send_button.png')),
            primaryColor: Colors.blue,
            backgroundColor: Colors.white,
            inputBackgroundColor: Colors.grey[200]!,
            inputTextColor: MyColors.black.color,
            secondaryColor: MyColors.secondaryMain.color,
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
