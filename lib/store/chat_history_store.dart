import 'package:flutter/material.dart';
import 'package:larn/models/chat.dart';
import 'package:larn/models/larn.dart';
import 'package:larn/services/db_service.dart';
import 'package:larn/store/larn_store.dart';
import 'package:provider/provider.dart';

typedef ChatHistory = Map<String, List<Chat>>;

class ChatHistoryStore with ChangeNotifier {
  ChatHistory history = {};
  final BuildContext context;

  ChatHistoryStore(this.context) {
    getPersistChats();
  }

  void getPersistChats() async {
    final List<Larn> larnList =
        Provider.of<LarnStore>(context, listen: false).larnList;
    for (Larn larn in larnList) {
      final Larn(:id, :image) = larn;
      List<Map<String, Object?>>? chats = await db
          ?.query("chat_histories", where: 'larn_id = ?', whereArgs: [id]);

      if (chats == null) return;

      for (Map<String, Object?> chat in chats) {
        Chat currentChat = Chat.fromJson({
          "image": image,
          ...chat,
        });
        addHistory(chat['larn_id'] as String, currentChat);
      }
    }
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
