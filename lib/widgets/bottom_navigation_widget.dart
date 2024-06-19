import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:larn/constants/colors.dart';

class BottomNavigationWidget extends StatelessWidget {
  const BottomNavigationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            width: 100,
            padding: const EdgeInsets.all(20.0),
            child: const Column(
              children: [
                FaIcon(FontAwesomeIcons.house),
                SizedBox(height: 10),
                Text("หน้าหลัก"),
              ],
            ),
          ),
          Transform.translate(
            offset: const Offset(0, -40),
            child: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.circular(100),
              ),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  FaIcon(
                    FontAwesomeIcons.person,
                    size: 38,
                  ),
                  Text("เรียกหลาน"),
                ],
              ),
            ),
          ),
          Container(
            width: 100,
            padding: const EdgeInsets.all(20.0),
            child: const Column(
              children: [
                FaIcon(FontAwesomeIcons.message),
                SizedBox(height: 10),
                Text("แชท"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
