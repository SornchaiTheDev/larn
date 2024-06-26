import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:larn/store/settings_store.dart';
import 'package:provider/provider.dart';

class BottomNavigationWidget extends StatelessWidget {
  const BottomNavigationWidget(
      {super.key, required this.onTap, required this.currentIndex});

  final int currentIndex;
  final Function(int index) onTap;

  @override
  Widget build(BuildContext context) {
    Color primaryColor = Theme.of(context).primaryColor;
    double bodyFontSize = Provider.of<SettingStore>(context).bodyFontSize;

    return SizedBox(
      height: 110,
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
                    child: Column(
                      children: [
                        const FaIcon(FontAwesomeIcons.house),
                        const SizedBox(height: 10),
                        Text(
                          "หน้าหลัก",
                          style: TextStyle(
                            fontSize: bodyFontSize,
                          ),
                        ),
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
                        Text(
                          "แชท",
                          style: TextStyle(
                            fontSize: bodyFontSize,
                          ),
                        ),
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
