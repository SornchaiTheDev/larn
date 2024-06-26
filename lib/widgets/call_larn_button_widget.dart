import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:larn/constants/colors.dart';

class CallLarnButtonWidget extends StatelessWidget {
  const CallLarnButtonWidget({super.key, required this.onTap});

  final Function(int) onTap;
  @override
  Widget build(BuildContext context) {
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
              child: const Column(
                children: [
                  FaIcon(
                    FontAwesomeIcons.person,
                    size: 38,
                  ),
                  Text("เรียกหลาน"),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
