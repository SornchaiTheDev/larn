import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:larn/constants/colors.dart';
import 'package:larn/widgets/apps_icon_widget.dart';
import 'package:larn/widgets/back_button_widget.dart';

class AddLarnScreen extends StatelessWidget {
  const AddLarnScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: BackButtonWidget(),
                  ),
                  Text(
                    "เพิ่มหลาน",
                    style: TextStyle(
                      fontSize: 22,
                    ),
                  ),
                  Expanded(
                    child: SizedBox(
                      width: 10,
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(14.0),
                child: ListView(
                  clipBehavior: Clip.antiAlias,
                  children: [
                    Ink(
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
                                  backgroundImage:
                                      AssetImage("assets/images/larn1.png"),
                                ),
                                const SizedBox(
                                  width: 24,
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        "หลานภาษา",
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      const SizedBox(height: 6),
                                      const Text(
                                        "หลานบันเทิงจะช่วยให้คุณ ใช้งานแอปพลิเคชันความบันเทิงได้ง่ายขึ้น",
                                      ),
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
                                const Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("แอปที่สอน"),
                                    SizedBox(height: 6),
                                    AppsIconWidget()
                                  ],
                                ),
                                InkWell(
                                  onTap: () {},
                                  splashColor: Colors.amber,
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(10.0),
                                  ),
                                  child: Ink(
                                    padding: const EdgeInsets.fromLTRB(
                                        24, 12, 24, 12),
                                    decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(10.0),
                                      ),
                                      color: primaryColor,
                                    ),
                                    child: const Row(
                                      children: [
                                        FaIcon(
                                          FontAwesomeIcons.plus,
                                          size: 14,
                                        ),
                                        SizedBox(width: 10),
                                        Text(
                                          "เพิ่มหลาน",
                                          style: TextStyle(
                                            fontSize: 16,
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
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
