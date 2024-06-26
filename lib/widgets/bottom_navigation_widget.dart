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
    return SizedBox(
      height: 100,
      child: Stack(
        children: [
          Row(
            children: [
              Expanded(
                child: InkWell(
                  onTap: () => onTap(0),
                  child: Container(
                    width: 100,
                    decoration: BoxDecoration(
                      border: const Border(
                        top: BorderSide(
                          width: 1,
                          color: Colors.black12,
                        ),
                      ),
                      color: currentIndex == 0 ? primaryColor : Colors.white,
                    ),
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
                  child: Container(
                    decoration: BoxDecoration(
                      border: const Border(
                        top: BorderSide(
                          width: 1,
                          color: Colors.black12,
                        ),
                      ),
                      color: currentIndex == 1 ? primaryColor : Colors.white,
                    ),
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
        ],
      ),
    );
  }
}
