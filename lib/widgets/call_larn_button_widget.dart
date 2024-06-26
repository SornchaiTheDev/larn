import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:larn/constants/font_size.dart';
import 'package:larn/store/settings_store.dart';
import 'package:provider/provider.dart';

class CallLarnButtonWidget extends StatelessWidget {
  const CallLarnButtonWidget({super.key, required this.onTap});

  final Function(int) onTap;
  @override
  Widget build(BuildContext context) {
    Color primaryColor = Theme.of(context).primaryColor;
    double bodyFontSize = Provider.of<SettingStore>(context).bodyFontSize;
    FontSize activeFontSize = Provider.of<SettingStore>(context).activeFontSize;

    double containerSize;

    switch (activeFontSize) {
      case FontSize.small:
        containerSize = 100;
        break;
      case FontSize.medium:
        containerSize = 120;
        break;
      case FontSize.large:
        containerSize = 130;
        break;
      case FontSize.extraLarge:
        containerSize = 140;
        break;
    }

    return Positioned(
      bottom: 50,
      left: 0,
      right: 0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () => onTap(2),
            child: Container(
              width: containerSize,
              height: containerSize,
              padding: const EdgeInsets.all(18.0),
              decoration: BoxDecoration(
                color: primaryColor,
                border: Border.all(
                  width: 8,
                  color: Colors.white,
                  strokeAlign: BorderSide.strokeAlignOutside,
                ),
                borderRadius: const BorderRadius.all(
                  Radius.circular(100.0),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const FaIcon(
                    FontAwesomeIcons.person,
                    size: 38,
                  ),
                  Text(
                    "เรียกหลาน",
                    style: TextStyle(
                      fontSize: bodyFontSize,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
