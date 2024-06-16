import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:larn/widgets/home_content_widget.dart';

class AppContentWidget extends StatelessWidget {
  const AppContentWidget({super.key});

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
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("แนะนำ"),
              Text(
                "Netflix",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ],
          )
        ],
      ),
      content: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FaIcon(
            FontAwesomeIcons.play,
            size: 40,
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "กดเพื่อดูข้อมูล",
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }
}
