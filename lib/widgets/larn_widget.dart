import 'package:flutter/material.dart';
import 'package:larn/store/settings_store.dart';
import 'package:larn/widgets/apps_icon_widget.dart';
import 'package:provider/provider.dart';

class LarnWidget extends StatelessWidget {
  const LarnWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double bodyFontSize = Provider.of<SettingStore>(context).bodyFontSize;
    double subHeadingFontSize =
        Provider.of<SettingStore>(context).subHeadingFontSize;

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
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "หลานบันเทิง",
                    style: TextStyle(fontSize: subHeadingFontSize),
                  ),
                  Text(
                    "หลานบันเทิงจะช่วยให้คุณ ใช้งานแอปพลิเคชันความบันเทิงได้ง่ายขึ้น",
                    style: TextStyle(fontSize: bodyFontSize),
                  ),
                  const SizedBox(height: 8),
                  const AppsIconWidget(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
