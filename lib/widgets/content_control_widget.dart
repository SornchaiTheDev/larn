import 'package:flutter/material.dart';

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
            style: const TextStyle(
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
