import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:larn/widgets/home_content_widget.dart';

class LarnContentWidget extends StatelessWidget {
  const LarnContentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return HomeContentWidget(
      topLeft: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            "https://static-00.iconduck.com/assets.00/netflix-icon-icon-2048x2048-yj41gpvr.png",
            width: 80,
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Nibh nisl condimentum id venenatis a. Urna duis convallis convallis tellus id interdum. Sit amet porttitor eget dolor"),
            const SizedBox(height: 20),
            const FaIcon(
              FontAwesomeIcons.solidHeart,
              color: Colors.red,
              size: 24,
            ),
            const SizedBox(height: 60),
            Align(
              alignment: Alignment.center,
              child: InkWell(
                onTap: () {},
                borderRadius: BorderRadius.circular(100),
                child: Ink(
                  padding: const EdgeInsets.fromLTRB(24, 12, 24, 12),
                  width: 200,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: const Center(
                    child: Text(
                      "กดเพื่อคุยต่อ",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
