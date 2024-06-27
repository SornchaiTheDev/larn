import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:larn/store/settings_store.dart';
import 'package:larn/widgets/content_control_widget.dart';
import 'package:provider/provider.dart';

class HomeContentWidget extends StatelessWidget {
  const HomeContentWidget({
    super.key,
    required this.topLeft,
    required this.content,
    required this.onNext,
    required this.onPrev,
    required this.isVolumeOn,
    required this.onVolumeToggle,
  });

  final Widget topLeft;
  final Widget content;

  final VoidCallback onNext;
  final VoidCallback onPrev;
  final VoidCallback onVolumeToggle;

  final bool isVolumeOn;

  @override
  Widget build(BuildContext context) {
    double bodyfontsize = Provider.of<SettingStore>(context).bodyFontSize;

    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Ink(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  topLeft,
                  VolumeControlWidget(
                    bodyfontsize: bodyfontsize,
                    isVolumeOn: isVolumeOn,
                    onVolumeToggle: onVolumeToggle,
                  )
                ],
              ),
            ),
            Flexible(
              flex: 1,
              child: content,
            ),
            Ink(
              height: 100,
              child: Row(
                children: [
                  Flexible(
                    flex: 1,
                    child: ContentControlWidget(
                        border: const Border(
                          top: BorderSide(color: Colors.grey),
                          right: BorderSide(color: Colors.grey),
                        ),
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                        ),
                        onTap: onPrev,
                        title: "ก่อนหน้า"),
                  ),
                  Flexible(
                    flex: 1,
                    child: ContentControlWidget(
                      border: const Border(
                        top: BorderSide(color: Colors.grey),
                      ),
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ),
                      onTap: onNext,
                      title: "ถัดไป",
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class VolumeControlWidget extends StatelessWidget {
  const VolumeControlWidget({
    super.key,
    required this.bodyfontsize,
    required this.isVolumeOn,
    required this.onVolumeToggle,
  });

  final double bodyfontsize;
  final bool isVolumeOn;
  final VoidCallback onVolumeToggle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onVolumeToggle,
      child: Column(
        children: [
          const FaIcon(FontAwesomeIcons.volumeHigh),
          const SizedBox(height: 12),
          Text(
            "${isVolumeOn ? "ปิด" : "เปิด"}เสียง",
            style: TextStyle(
              fontSize: bodyfontsize,
            ),
          ),
        ],
      ),
    );
  }
}
