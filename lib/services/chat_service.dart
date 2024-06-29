import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:larn/constants/bubble.dart';
import 'package:larn/models/chat.dart';
import 'package:larn/store/chat_history_store.dart';
import 'package:socket_io_client/socket_io_client.dart' as io;

class ChatService with ChangeNotifier {
  late io.Socket socket;
  late BuildContext context;
  late VoidCallback onReceived;
  bool isTyping = false;
  String larnId = "";
  List<Chat> chats = [];
  final ChatHistoryStore chatHistory = ChatHistoryStore().getInstance();

  ChatService() {
    initSocketIO();
    chats = chatHistory.getHistory(larnId);
    notifyListeners();
  }

  @override
  void dispose() {
    super.dispose();
    socket.dispose();
  }

  void config(
    BuildContext context, {
    required String larnId,
    required VoidCallback onReceived,
  }) {
    this.larnId = larnId;
    this.context = context;
    this.onReceived = onReceived;
  }

  void sendMessage(String message) {
    Chat currentMessage = Chat(
      name: "Test",
      image: "assets/images/larn1.png",
      type: ChatType.text,
      content: message,
      timestamp: DateTime.now(),
      side: BubbleSide.right,
    );
    chats.add(currentMessage);

    notifyListeners();
    chatHistory.addHistory(larnId, currentMessage);
    socket.emit("message", message);
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
        name: "Test",
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

      chats.add(currentChat);
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
