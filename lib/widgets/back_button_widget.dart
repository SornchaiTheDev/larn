import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:larn/store/settings_store.dart';
import 'package:provider/provider.dart';

class BackButtonWidget extends StatelessWidget {
  const BackButtonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double bodyFontSize = Provider.of<SettingStore>(context).bodyFontSize;

    return IntrinsicWidth(
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
        },
        child: Ink(
          padding: const EdgeInsets.all(10.0),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(10.0),
            ),
          ),
          child: Row(
            children: [
              const FaIcon(FontAwesomeIcons.chevronLeft),
              const SizedBox(width: 12),
              Text(
                "ย้อนกลับ",
                style: TextStyle(
                  fontSize: bodyFontSize,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
