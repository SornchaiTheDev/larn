import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:larn/constants/bubble.dart';
import 'package:larn/store/settings_store.dart';
import 'package:provider/provider.dart';

class MediaBubbleWidget extends StatelessWidget {
  const MediaBubbleWidget({
    super.key,
    required this.side,
    required this.src,
    required this.image,
  });

  final BubbleSide side;
  final String src;
  final String image;

  @override
  Widget build(BuildContext context) {
    bool isLeftSide = side == BubbleSide.left;
    double bodyFontSize = Provider.of<SettingStore>(context).bodyFontSize;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Visibility(
          visible: side == BubbleSide.left,
          child: CircleAvatar(
            radius: 20,
            backgroundImage: AssetImage(image),
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
              Container(
                width: 300,
                height: 400,
                clipBehavior: Clip.antiAlias,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(12.0),
                  ),
                ),
                child: Image.network(
                  src,
                  fit: BoxFit.cover,
                  loadingBuilder: (context, child, loadingProgress) =>
                      loadingProgress == null
                          ? child
                          : const SizedBox(
                              width: 400,
                              height: 300,
                              child: Center(
                                child: CircularProgressIndicator(),
                              ),
                            ),
                  errorBuilder: (context, error, stackTrace) => SizedBox(
                    width: 400,
                    height: 400,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const FaIcon(
                          FontAwesomeIcons.triangleExclamation,
                          color: Colors.red,
                        ),
                        const SizedBox(height: 20),
                        Text(
                          "เกิดข้อผิดพลาดในการโหลดมีเดีย",
                          style: TextStyle(
                            fontSize: bodyFontSize,
                          ),
                        ),
                      ],
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
