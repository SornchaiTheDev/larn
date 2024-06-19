import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:larn/constants/colors.dart';

class BottomNavigationWidget extends StatelessWidget {
  const BottomNavigationWidget(
      {super.key, required this.onTap, required this.currentIndex});

  final int currentIndex;
  final Function(int index) onTap;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Ink(
          height: 100,
          color: Colors.white,
          child: Row(
            children: [
              Expanded(
                child: InkWell(
                  onTap: () => onTap(0),
                  child: Ink(
                    width: 100,
                    color: currentIndex == 0 ? primaryColor : Colors.white,
                    padding: const EdgeInsets.all(20.0),
                    child: const Column(
                      children: [
                        FaIcon(FontAwesomeIcons.house),
                        SizedBox(height: 10),
                        Text("หน้าหลัก"),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: InkWell(
                  onTap: () => onTap(1),
                  child: Ink(
                    color: currentIndex == 1 ? primaryColor : Colors.white,
                    width: 100,
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        FaIcon(
                          currentIndex == 1
                              ? FontAwesomeIcons.solidMessage
                              : FontAwesomeIcons.message,
                        ),
                        const SizedBox(height: 10),
                        const Text("แชท"),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Transform.translate(
                offset: const Offset(0, -40),
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(100),
                    border: Border.all(
                      color: Colors.white,
                      width: 6,
                      strokeAlign: BorderSide.strokeAlignOutside,
                    ),
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
              )
            ],
          ),
        ),
      ],
    );
  }
}