import 'package:larn/constants/bubble.dart';

enum ChatType { text, media }

class Chat {
  final String name;
  final String image;
  final ChatType type;
  final BubbleSide side;
  final String content;
  final DateTime timestamp;

  Chat({
    required this.name,
    required this.image,
    required this.type,
    required this.content,
    required this.timestamp,
    required this.side,
  });
}
