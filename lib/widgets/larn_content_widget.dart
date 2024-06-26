import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:larn/store/settings_store.dart';
import 'package:larn/widgets/home_content_widget.dart';
import 'package:provider/provider.dart';

class LarnContentWidget extends StatelessWidget {
  const LarnContentWidget({
    super.key,
    required this.onNext,
    required this.onPrev,
  });

  final VoidCallback onPrev;
  final VoidCallback onNext;

  @override
  Widget build(BuildContext context) {
    Color primaryColor = Theme.of(context).primaryColor;
    double bodyFontSize = Provider.of<SettingStore>(context).bodyFontSize;
    double subHeadingFontSize =
        Provider.of<SettingStore>(context).subHeadingFontSize;

    return HomeContentWidget(
      onNext: onNext,
      onPrev: onPrev,
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
              "assets/images/larn1.png",
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 12),
          Text(
            "หลานข่าว",
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Nibh nisl condimentum id venenatis a. Urna duis convallis convallis tellus id interdum. Sit amet porttitor eget dolor",
                          style: TextStyle(
                            fontSize: bodyFontSize,
                          ),
                        ),
                        const SizedBox(height: 20),
                        const FaIcon(
                          FontAwesomeIcons.solidHeart,
                          color: Colors.red,
                          size: 24,
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
            child: Column(
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
            ),
          ),
        ],
      ),
    );
  }
}
