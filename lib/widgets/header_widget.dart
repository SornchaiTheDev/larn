import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:larn/store/settings_store.dart';
import 'package:provider/provider.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double headingFontSize = Provider.of<SettingStore>(context).headingFontSize;
    double subHeadingFontSize =
        Provider.of<SettingStore>(context).subHeadingFontSize;
    double bodyfontsize = Provider.of<SettingStore>(context).bodyFontSize;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "สวัสดีค่ะ",
              style: TextStyle(fontSize: bodyfontsize),
            ),
            Text(
              "Guest",
              style: TextStyle(fontSize: headingFontSize),
            ),
          ],
        ),
        InkWell(
          onTap: () {
            Navigator.pushNamed(context, "/settings");
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                const FaIcon(FontAwesomeIcons.gear),
                const SizedBox(width: 8),
                Text("ตั้งค่า", style: TextStyle(fontSize: subHeadingFontSize)),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
