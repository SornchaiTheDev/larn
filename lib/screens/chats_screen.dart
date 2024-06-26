import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:larn/widgets/larn_widget.dart';
import 'package:larn/widgets/search_widget.dart';

class ChatsScreen extends StatelessWidget {
  const ChatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text("คุยกับหลาน", style: TextStyle(fontSize: 24)),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, "/add-larn");
                  },
                  child: const Row(
                    children: [
                      FaIcon(FontAwesomeIcons.userPlus),
                      SizedBox(width: 8),
                      Text("เพิ่มหลาน", style: TextStyle(fontSize: 16)),
                    ],
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 10),
          const Padding(
            padding: EdgeInsets.all(12.0),
            child: SearchWidget(),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: ListView(
              children: const [
                Divider(),
                LarnWidget(),
                Divider(),
                LarnWidget(),
                Divider(),
                LarnWidget(),
                Divider(),
                LarnWidget(),
                Divider(),
                LarnWidget(),
                Divider(),
                LarnWidget(),
                Divider(),
                SizedBox(height: 160),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
