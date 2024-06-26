import 'package:flutter/material.dart';
import 'package:larn/widgets/apps_icon_widget.dart';

class LarnWidget extends StatelessWidget {
  const LarnWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, "/chat");
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage("assets/images/larn1.png"),
            ),
            const SizedBox(width: 12),
            const Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  const Text(
                    "หลานบันเทิง",
                    style: TextStyle(fontSize: 20),
                  ),
                  const Text(
                    "หลานบันเทิงจะช่วยให้คุณ ใช้งานแอปพลิเคชันความบันเทิงได้ง่ายขึ้น",
                    style: TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 8),
                  AppsIconWidget(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
