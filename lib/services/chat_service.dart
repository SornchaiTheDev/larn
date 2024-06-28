import 'package:flutter/material.dart';
import 'package:larn/constants/bubble.dart';
import 'package:larn/models/chat.dart';
import 'package:socket_io_client/socket_io_client.dart' as io;

class ChatService with ChangeNotifier {
  late io.Socket socket;
  final List<Chat> chats = [];

  bool isTyping = false;

  ChatService() {
    socket = io.io(
      "https://ais-be.tu4rl4.easypanel.host",
      io.OptionBuilder().setTransports(['websocket']).build(),
    );

    socket.onConnect((_) {
      socket.emit("initialize", "667d55ba1d8bfd5076e21651");
    });

    socket.on("response", (data) {
      chats.add(
        Chat(
          name: "Test",
          image: "assets/images/larn1.png",
          type: ChatType.text,
          content: data,
          timestamp: DateTime.now(),
          side: BubbleSide.left,
        ),
      );
      notifyListeners();
    });

    socket.onError((err) {
      print(err);
    });

    socket.on("typing", (isTyping) {
      print(isTyping);
      this.isTyping = isTyping;
      notifyListeners();
    });
  }

  void sendMessage(String message) {
    chats.add(
      Chat(
        name: "Test",
        image: "assets/images/larn1.png",
        type: ChatType.text,
        content: message,
        timestamp: DateTime.now(),
        side: BubbleSide.right,
      ),
    );
    notifyListeners();
    print("send message");
    socket.emit("message", message);
  }

  @override
  void dispose() {
    socket.dispose();
    super.dispose();
  }
}
