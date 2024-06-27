import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:larn/store/settings_store.dart';
import 'package:larn/widgets/home_content_widget.dart';
import 'package:provider/provider.dart';

class LarnContentWidget extends StatefulWidget {
  const LarnContentWidget({
    super.key,
    required this.onNext,
    required this.onPrev,
    required this.name,
    required this.content,
    required this.profileImage,
  });

  final VoidCallback onPrev;
  final VoidCallback onNext;
  final String name;
  final String content;
  final String profileImage;

  @override
  State<LarnContentWidget> createState() => _LarnContentWidgetState();
}

class _LarnContentWidgetState extends State<LarnContentWidget> {
  bool isLove = false;

  @override
  Widget build(BuildContext context) {
    Color primaryColor = Theme.of(context).primaryColor;
    double bodyFontSize = Provider.of<SettingStore>(context).bodyFontSize;
    double subHeadingFontSize =
        Provider.of<SettingStore>(context).subHeadingFontSize;

    return HomeContentWidget(
      isVolumeOn: false,
      onVolumeToggle: () {},
      onNext: widget.onNext,
      onPrev: widget.onPrev,
      topLeft: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 80,
            height: 80,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
            ),
            child: Image.asset(
              widget.profileImage,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 12),
          Text(
            widget.name,
            style: TextStyle(
              fontSize: subHeadingFontSize,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
      content: Stack(
        children: [
          ListView(
            padding: EdgeInsets.zero,
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.content,
                          style: TextStyle(
                            fontSize: bodyFontSize,
                          ),
                        ),
                        const SizedBox(height: 20),
                        GestureDetector(
                          onTap: () => setState(() {
                            isLove = !isLove;
                          }),
                          child: FaIcon(
                            isLove
                                ? FontAwesomeIcons.solidHeart
                                : FontAwesomeIcons.heart,
                            color: isLove ? Colors.red : Colors.grey,
                            size: 24,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: CTAButonWidget(
              primaryColor: primaryColor,
              bodyFontSize: bodyFontSize,
            ),
          ),
        ],
      ),
    );
  }
}

class CTAButonWidget extends StatelessWidget {
  const CTAButonWidget({
    super.key,
    required this.primaryColor,
    required this.bodyFontSize,
  });

  final Color primaryColor;
  final double bodyFontSize;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.center,
          child: InkWell(
            onTap: () {},
            borderRadius: BorderRadius.circular(100),
            child: Ink(
              padding: const EdgeInsets.fromLTRB(24, 12, 24, 12),
              width: 200,
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.circular(100),
              ),
              child: Center(
                child: Text(
                  "กดเพื่อคุยต่อ",
                  style: TextStyle(
                    fontSize: bodyFontSize,
                  ),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
