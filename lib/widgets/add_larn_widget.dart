import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:larn/store/settings_store.dart';
import 'package:larn/widgets/apps_icon_widget.dart';
import 'package:provider/provider.dart';

class AddLarnWidget extends StatelessWidget {
  const AddLarnWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Color primaryColor = Theme.of(context).primaryColor;
    double bodyFontSize = Provider.of<SettingStore>(context).bodyFontSize;
    double subHeadingFontSize =
        Provider.of<SettingStore>(context).subHeadingFontSize;

    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Ink(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: Colors.black26,
              width: 2,
            ),
            borderRadius: const BorderRadius.all(
              Radius.circular(10.0),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(14.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage("assets/images/larn1.png"),
                    ),
                    const SizedBox(
                      width: 24,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "หลานภาษา",
                            style: TextStyle(
                              fontSize: subHeadingFontSize,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(
                              "หลานบันเทิงจะช่วยให้คุณ ใช้งานแอปพลิเคชันความบันเทิงได้ง่ายขึ้น",
                              style: TextStyle(
                                fontSize: bodyFontSize,
                              )),
                          const SizedBox(height: 12),
                        ],
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Visibility(
                      visible: false,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "แอปที่สอน",
                            style: TextStyle(
                              fontSize: bodyFontSize,
                            ),
                          ),
                          const SizedBox(height: 6),
                          const AppsIconWidget(
                            appList: [],
                          )
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      borderRadius: const BorderRadius.all(
                        Radius.circular(10.0),
                      ),
                      child: Ink(
                        padding: const EdgeInsets.fromLTRB(24, 12, 24, 12),
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(10.0),
                          ),
                          color: primaryColor,
                        ),
                        child: Row(
                          children: [
                            const FaIcon(
                              FontAwesomeIcons.plus,
                              size: 14,
                            ),
                            const SizedBox(width: 10),
                            Text(
                              "เพิ่มหลาน",
                              style: TextStyle(
                                fontSize: bodyFontSize,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
