import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:larn/constants/colors.dart';
import 'package:larn/widgets/app_content_widget.dart';
import 'package:larn/widgets/header_widget.dart';
import 'package:larn/widgets/home_content_widget.dart';
import 'package:larn/widgets/larn_content_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SafeArea(
            child: Padding(
              padding: EdgeInsets.all(10),
              child: HeaderWidget(),
            ),
          ),
          const Flexible(
            flex: 1,
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: LarnContentWidget(),
            ),
          ),
          const SizedBox(height: 40),
          Container(
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
          ),
        ],
      ),
    );
  }
}
