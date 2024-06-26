import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:larn/store/settings_store.dart';
import 'package:larn/widgets/home_content_widget.dart';
import 'package:provider/provider.dart';

class AppContentWidget extends StatelessWidget {
  const AppContentWidget({
    super.key,
    required this.onNext,
    required this.onPrev,
  });

  final VoidCallback onPrev;
  final VoidCallback onNext;

  @override
  Widget build(BuildContext context) {
    double bodyfontsize = Provider.of<SettingStore>(context).bodyFontSize;
    double subheadingFontSize =
        Provider.of<SettingStore>(context).subHeadingFontSize;

    return HomeContentWidget(
      onNext: onNext,
      onPrev: onPrev,
      topLeft: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            "https://static-00.iconduck.com/assets.00/netflix-icon-icon-2048x2048-yj41gpvr.png",
            width: 80,
          ),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "แนะนำ",
                style: TextStyle(fontSize: bodyfontsize),
              ),
              Text(
                "Netflix",
                style: TextStyle(
                  fontSize: subheadingFontSize,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          )
        ],
      ),
      content: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const FaIcon(
            FontAwesomeIcons.play,
            size: 40,
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            "กดเพื่อดูข้อมูล",
            style: TextStyle(
              fontSize: subheadingFontSize,
            ),
          ),
        ],
      ),
    );
  }
}
