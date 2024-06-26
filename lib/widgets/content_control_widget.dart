import 'package:flutter/material.dart';
import 'package:larn/store/settings_store.dart';
import 'package:provider/provider.dart';

class ContentControlWidget extends StatelessWidget {
  const ContentControlWidget({
    super.key,
    required this.onTap,
    required this.title,
    required this.border,
    required this.borderRadius,
  });

  final String title;
  final VoidCallback onTap;
  final Border border;
  final BorderRadius borderRadius;
  @override
  Widget build(BuildContext context) {
    double bodyFontSize = Provider.of<SettingStore>(context).bodyFontSize;

    return InkWell(
      onTap: onTap,
      child: Ink(
        decoration: BoxDecoration(
          color: Colors.white,
          border: border,
          borderRadius: borderRadius,
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              color: Colors.black,
              fontSize: bodyFontSize,
            ),
          ),
        ),
      ),
    );
  }
}
