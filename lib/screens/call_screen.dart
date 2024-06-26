import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:larn/widgets/action_button_widget.dart';

class CallScreen extends StatelessWidget {
  const CallScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 90,
              backgroundImage: AssetImage("assets/images/larn1.png"),
            ),
            const SizedBox(height: 32),
            const Text(
              "หลานโช",
              style: TextStyle(
                fontSize: 32,
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            const Text(
              "16:07",
              style: TextStyle(
                fontSize: 26,
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ActionButtonWidget(
                  icon: const FaIcon(
                    FontAwesomeIcons.microphone,
                    size: 32,
                  ),
                  title: "ปิดไมค์",
                  onTap: () {},
                ),
                const SizedBox(
                  width: 24,
                ),
                ActionButtonWidget(
                  icon: const FaIcon(
                    FontAwesomeIcons.chromecast,
                    size: 32,
                  ),
                  title: "แชร์หน้าจอ",
                  onTap: () {},
                ),
              ],
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {},
              style: const ButtonStyle(
                fixedSize: WidgetStatePropertyAll(
                  Size(300, 60),
                ),
                backgroundColor: WidgetStatePropertyAll(
                  Colors.red,
                ),
              ),
              child: const Text(
                "วางสาย",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
