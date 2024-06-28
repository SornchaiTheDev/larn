import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:larn/models/larn.dart';
import 'package:larn/store/settings_store.dart';
import 'package:larn/widgets/apps_icon_widget.dart';
import 'package:provider/provider.dart';

class LarnWidget extends StatelessWidget {
  const LarnWidget({
    super.key,
    required this.larn,
  });

  final Larn larn;

  @override
  Widget build(BuildContext context) {
    final Larn(:name, :description, :image, :id, :appList) = larn;

    double bodyFontSize = Provider.of<SettingStore>(context).bodyFontSize;
    double subHeadingFontSize =
        Provider.of<SettingStore>(context).subHeadingFontSize;

    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, "/chat", arguments: larn);
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage(image),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(fontSize: subHeadingFontSize),
                  ),
                  Text(
                    description,
                    style: TextStyle(fontSize: bodyFontSize),
                  ),
                  const SizedBox(height: 8),
                  AppsIconWidget(appList: appList),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
