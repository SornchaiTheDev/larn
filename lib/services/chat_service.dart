import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:larn/constants/bubble.dart';
import 'package:larn/models/chat.dart';
import 'package:larn/services/db_service.dart';
import 'package:larn/store/chat_history_store.dart';
import 'package:provider/provider.dart';
import 'package:socket_io_client/socket_io_client.dart' as io;

class ChatService with ChangeNotifier {
  late io.Socket socket;
  late VoidCallback onReceived;
  bool isTyping = false;
  String larnId = "";
  final BuildContext context;
  late ChatHistoryStore chatHistory;

  ChatService(this.context) {
    initSocketIO();
    chatHistory = Provider.of<ChatHistoryStore>(context, listen: false);
    notifyListeners();
  }

  @override
  void dispose() {
    super.dispose();
    socket.dispose();
  }

  void config({
    required String larnId,
    required VoidCallback onReceived,
  }) {
    this.larnId = larnId;
    this.onReceived = onReceived;
  }

  void sendMessage(String message) {
    Chat currentMessage = Chat(
      image: "assets/images/larn1.png",
      type: ChatType.text,
      content: message,
      timestamp: DateTime.now(),
      side: BubbleSide.right,
    );

    notifyListeners();
    chatHistory.addHistory(larnId, currentMessage);
    insertToDb(currentMessage);
    socket.emit("message", message);
  }

  void insertToDb(Chat message) {
    final Chat(:type, :content, :timestamp, :side) = message;

    db?.insert("chat_histories", {
      "larn_id": larnId,
      "type": type.toString().split('.').last,
      "content": content,
      "timestamp": timestamp.toIso8601String(),
      "side": side.toString().split('.').last,
    });
  }

  void initSocketIO() {
    socket = io.io(
      "https://ais-be.tu4rl4.easypanel.host",
      io.OptionBuilder().setTransports(['websocket']).build(),
    );

    socket.onConnect((_) {
      socket.emit("initialize", larnId);
    });

    socket.on("response", (data) {
      final currentChat = Chat(
        image: "assets/images/larn1.png",
        type: ChatType.text,
        content: data,
        timestamp: DateTime.now(),
        side: BubbleSide.left,
      );

      chatHistory.addHistory(
        larnId,
        currentChat,
      );

      insertToDb(currentChat);

      onReceived();
      notifyListeners();
    });

    socket.onError((err) {
      print(err);
    });

    // socket.on("typing", (isTyping) {
    //   print(isTyping);
    //   this.isTyping = isTyping;
    //   notifyListeners();
    // });
  }
}
