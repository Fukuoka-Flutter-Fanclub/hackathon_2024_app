import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_riverpod/flutter_riverpod.dart';

final messagesProvider =
    StateNotifierProvider<MessagesNotifier, List<types.Message>>((ref) {
  return MessagesNotifier();
});

class MessagesNotifier extends StateNotifier<List<types.Message>> {
  MessagesNotifier() : super([]);

  void addMessage(types.Message message) {
    state = [message, ...state];
  }

  void updateMessage(types.Message updatedMessage) {
    state = state.map((message) {
      if (message.id == updatedMessage.id) {
        return updatedMessage;
      }
      return message;
    }).toList();
  }
}