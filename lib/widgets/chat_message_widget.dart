import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:speech_to_text/speech_to_text_provider.dart';

class ChatMessageWidget extends StatefulWidget {
  const ChatMessageWidget({
    super.key,
    required this.textController,
    required this.onSend,
  });

  final TextEditingController textController;
  final VoidCallback onSend;

  @override
  State<ChatMessageWidget> createState() => _ChatMessageWidgetState();
}

class _ChatMessageWidgetState extends State<ChatMessageWidget> {
  @override
  Widget build(BuildContext context) {
    var speechProvider =
        Provider.of<SpeechToTextProvider>(context, listen: true);

    bool isNotEmpty = widget.textController.text.isNotEmpty;

    void handleOnAction() {
      if (isNotEmpty) {
        widget.onSend();
      } else {
        if (!speechProvider.isAvailable) return;

        if (!speechProvider.isListening) {
          speechProvider.listen(
            partialResults: true,
            localeId: "th-TH",
          );
        } else {
          speechProvider.cancel();
        }
      }
    }

    return Row(
      children: [
        Expanded(
          child: TextField(
            // onChanged: (value) => setState(() {}),
            controller: widget.textController,
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
          onPressed: handleOnAction,
          icon: isNotEmpty
              ? const FaIcon(FontAwesomeIcons.paperPlane)
              : FaIcon(
                  speechProvider.isAvailable
                      ? FontAwesomeIcons.microphone
                      : FontAwesomeIcons.microphoneSlash,
                  color: !speechProvider.isAvailable
                      ? Colors.red
                      : speechProvider.isListening
                          ? Theme.of(context).primaryColor
                          : Colors.black,
                ),
        ),
      ],
    );
  }
}
