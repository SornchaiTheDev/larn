import 'package:larn/constants/bubble.dart';

enum ChatType { text, media }

class Chat {
  final String image;
  final ChatType type;
  final BubbleSide side;
  final String content;
  final DateTime timestamp;

  Chat({
    required this.image,
    required this.type,
    required this.content,
    required this.timestamp,
    required this.side,
  });

  factory Chat.fromJson(Map<String, dynamic> json) {
    return Chat(
      image: json['image'],
      type: json['type'] == 'text' ? ChatType.text : ChatType.media,
      content: json['content'],
      timestamp: DateTime.parse(json['timestamp']),
      side: json['side'] == 'right' ? BubbleSide.right : BubbleSide.left,
    );
  }
}
