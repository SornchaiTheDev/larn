import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:larn/constants/bubble.dart';
import 'package:larn/store/settings_store.dart';
import 'package:provider/provider.dart';

class ChatBubbleWidget extends StatelessWidget {
  const ChatBubbleWidget({
    super.key,
    required this.side,
    required this.text,
    required this.image,
  });

  final BubbleSide side;
  final String text;
  final String image;

  @override
  Widget build(BuildContext context) {
    bool isLeftSide = side == BubbleSide.left;
    double bodyFontSize = Provider.of<SettingStore>(context).bodyFontSize;

    return Row(
      mainAxisAlignment:
          isLeftSide ? MainAxisAlignment.start : MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Visibility(
          visible: side == BubbleSide.left,
          child: CircleAvatar(
            radius: 20,
            backgroundImage: NetworkImage(image),
          ),
        ),
        const SizedBox(
          width: 16,
        ),
        Visibility(
          visible: !isLeftSide,
          child: const Expanded(
            child: SizedBox(
              width: 1,
            ),
          ),
        ),
        Flexible(
          flex: 5,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Positioned(
                left: isLeftSide ? -3 : null,
                top: isLeftSide ? 6 : 2,
                right: isLeftSide ? null : 8,
                child: Transform.rotate(
                  angle: 40,
                  child: Container(
                    width: 24,
                    height: 32,
                    decoration: const BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.all(
                        Radius.circular(4.0),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  right: isLeftSide ? 32 : 12,
                ),
                padding: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(
                    width: 1,
                    color: Colors.black,
                  ),
                ),
                child: MarkdownBody(
                  data: text,
                  selectable: true,
                  styleSheet:
                      MarkdownStyleSheet.fromTheme(Theme.of(context)).copyWith(
                    p: TextStyle(
                      fontSize: bodyFontSize,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
