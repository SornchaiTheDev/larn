import 'package:flutter/material.dart';
import 'package:larn/models/chat.dart';

typedef ChatHistory = Map<String, List<Chat>>;

class ChatHistoryStore with ChangeNotifier {
  static ChatHistoryStore? instance;
  ChatHistory history = {};

  ChatHistoryStore getInstance() {
    instance ??= ChatHistoryStore();
    return instance!;
  }

  void addHistory(String chatId, Chat message) {
    if (!history.containsKey(chatId)) {
      history[chatId] = [message];
    } else {
      history[chatId]!.add(message);
    }
    notifyListeners();
  }

  List<Chat> getHistory(String chatId) {
    if (!history.containsKey(chatId)) {
      history[chatId] = [];
    }
    return history[chatId]!;
  }
}
