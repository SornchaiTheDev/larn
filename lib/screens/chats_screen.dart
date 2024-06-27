import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:larn/model/larn.dart';
import 'package:larn/store/larn_store.dart';
import 'package:larn/store/settings_store.dart';
import 'package:larn/widgets/larn_widget.dart';
import 'package:larn/widgets/search_widget.dart';
import 'package:provider/provider.dart';

class ChatsScreen extends StatelessWidget {
  const ChatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double headingFontSize = Provider.of<SettingStore>(context).headingFontSize;
    double bodyFontSize = Provider.of<SettingStore>(context).bodyFontSize;

    List<Larn> larnList = Provider.of<LarnStore>(context).larnList;
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
                Text(
                  "คุยกับหลาน",
                  style: TextStyle(
                    fontSize: headingFontSize,
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, "/add-larn");
                  },
                  child: Row(
                    children: [
                      const FaIcon(FontAwesomeIcons.userPlus),
                      const SizedBox(width: 8),
                      Text(
                        "เพิ่มหลาน",
                        style: TextStyle(fontSize: bodyFontSize),
                      ),
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
            child: ListView.builder(
              itemCount: larnList.length,
              itemBuilder: (context, index) {
                if (index == 9) {
                  return const SizedBox(height: 160);
                }

                return Column(
                  children: [
                    LarnWidget(
                      larn: larnList[index],
                    ),
                    const Divider(),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
