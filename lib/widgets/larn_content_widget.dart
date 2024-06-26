import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:larn/widgets/home_content_widget.dart';

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
          const Text(
            "หลานข่าว",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ],
      ),
      content: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Nibh nisl condimentum id venenatis a. Urna duis convallis convallis tellus id interdum. Sit amet porttitor eget dolor"),
                SizedBox(height: 20),
                FaIcon(
                  FontAwesomeIcons.solidHeart,
                  color: Colors.red,
                  size: 24,
                ),
              ],
            ),
            Column(
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
                      child: const Center(
                        child: Text(
                          "กดเพื่อคุยต่อ",
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
          ],
        ),
      ),
    );
  }
}
