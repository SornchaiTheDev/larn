import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ChatMessageWidget extends StatefulWidget {
  const ChatMessageWidget({
    super.key,
  });

  @override
  State<ChatMessageWidget> createState() => _ChatMessageWidgetState();
}

class _ChatMessageWidgetState extends State<ChatMessageWidget> {
  TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    bool isNotEmpty = textController.text.isNotEmpty;
    return Row(
      children: [
        Expanded(
          child: TextField(
            onChanged: (value) => setState(() {}),
            controller: textController,
            decoration: const InputDecoration(
              hintText: 'Enter text',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(30.0),
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(30.0),
                ),
                borderSide: BorderSide(color: Colors.blue),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(30.0),
                ),
                borderSide: BorderSide(color: Colors.grey),
              ),
            ),
          ),
        ),
        IconButton(
          onPressed: () {
            setState(() {});
            print(textController.text);
          },
          icon: isNotEmpty
              ? const FaIcon(FontAwesomeIcons.paperPlane)
              : const FaIcon(FontAwesomeIcons.microphone),
        ),
      ],
    );
  }
}
