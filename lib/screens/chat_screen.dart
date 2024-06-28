import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:larn/models/chat.dart';
import 'package:larn/models/larn.dart';
import 'package:larn/services/chat_service.dart';
import 'package:larn/store/settings_store.dart';
import 'package:larn/widgets/back_button_widget.dart';
import 'package:larn/widgets/chat_bubble_widget.dart';
import 'package:larn/widgets/chat_message_widget.dart';
import 'package:larn/widgets/media_bubble_widget.dart';
import 'package:provider/provider.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final Larn larn = ModalRoute.of(context)!.settings.arguments as Larn;
    final Larn(:name, :image) = larn;
    ChatService chatService = Provider.of<ChatService>(context, listen: true);
    List<Chat> chats = chatService.chats;

    double subHeadingFontSize =
        Provider.of<SettingStore>(context).subHeadingFontSize;

    double bodyFontSize = Provider.of<SettingStore>(context).bodyFontSize;

    void sendMessage() {
      chatService.sendMessage(textController.text);
      textController.clear();
    }

    return Scaffold(
      body: Column(
        children: [
          _buildHeader(name, subHeadingFontSize, context, larn, bodyFontSize),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(12.0, 0, 12.0, 0),
              child: ListView.builder(
                padding: const EdgeInsets.fromLTRB(0, 40, 0, 10),
                itemCount: chats.length,
                itemBuilder: (context, index) {
                  List<Widget> finalWidgets = [const SizedBox(height: 20)];
                  Chat currentChat = chats[index];
                  Widget widget;

                  if (currentChat.type == ChatType.text) {
                    widget = ChatBubbleWidget(
                      image: image,
                      side: currentChat.side,
                      text: currentChat.content,
                    );
                    finalWidgets.insert(0, widget);
                  }

                  if (currentChat.type == ChatType.media) {
                    widget = MediaBubbleWidget(
                      image: image,
                      side: currentChat.side,
                      src: currentChat.content,
                    );
                    finalWidgets.insert(0, widget);
                  }

                  return Column(
                    children: finalWidgets,
                  );
                },
              ),
            ),
          ),
          _buildSendMessage(sendMessage),
        ],
      ),
    );
  }

  Container _buildHeader(String name, double subHeadingFontSize,
      BuildContext context, Larn larn, double bodyFontSize) {
    return Container(
      padding: const EdgeInsets.fromLTRB(12.0, 58.0, 12.0, 6.0),
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              const BackButtonWidget(),
              Text(
                name,
                style: TextStyle(
                  fontSize: subHeadingFontSize,
                ),
              ),
            ],
          ),
          Row(
            children: [
              IconButton(
                onPressed: () => Navigator.pushNamed(
                  context,
                  "/call",
                  arguments: larn,
                ),
                icon: const FaIcon(
                  FontAwesomeIcons.phone,
                ),
              ),
              const SizedBox(
                width: 12,
              ),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, "/chat-other");
                },
                child: Ink(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      const FaIcon(FontAwesomeIcons.ellipsisVertical),
                      const SizedBox(
                        width: 12,
                      ),
                      Text(
                        'เพิ่มเติม',
                        style: TextStyle(fontSize: bodyFontSize),
                      ),
                    ],
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Container _buildSendMessage(VoidCallback sendMessage) {
    return Container(
      height: 100,
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(
            width: 1,
            color: Colors.black26,
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(12.0, 4, 12.0, 10),
        child: ChatMessageWidget(
          textController: textController,
          onSend: sendMessage,
        ),
      ),
    );
  }
}
