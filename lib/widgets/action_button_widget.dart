import 'package:flutter/material.dart';
import 'package:larn/store/settings_store.dart';
import 'package:provider/provider.dart';

class ActionButtonWidget extends StatelessWidget {
  const ActionButtonWidget({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
  });

  final String title;
  final Widget icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    double bodyFontSize = Provider.of<SettingStore>(context).bodyFontSize;
    return Column(
      children: [
        InkWell(
          onTap: () {},
          borderRadius: const BorderRadius.all(
            Radius.circular(100.0),
          ),
          child: Ink(
            width: 80,
            height: 80,
            padding: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black12, width: 2),
              borderRadius: const BorderRadius.all(
                Radius.circular(100.0),
              ),
            ),
            child: Center(
              child: icon,
            ),
          ),
        ),
        const SizedBox(height: 10),
        Text(
          title,
          style: TextStyle(
            fontSize: bodyFontSize,
          ),
        ),
      ],
    );
  }
}
