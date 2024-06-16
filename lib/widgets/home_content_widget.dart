import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:larn/widgets/content_control_widget.dart';

class HomeContentWidget extends StatelessWidget {
  const HomeContentWidget({
    super.key,
    required this.topLeft,
    required this.content,
  });

  final Widget topLeft;
  final Widget content;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Ink(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  topLeft,
                  const Column(
                    children: [
                      FaIcon(FontAwesomeIcons.volumeHigh),
                      SizedBox(height: 12),
                      Text("เปิด/ปิดเสียง"),
                    ],
                  )
                ],
              ),
            ),
            Flexible(
              flex: 1,
              child: content,
            ),
            Ink(
              height: 100,
              child: Row(
                children: [
                  Flexible(
                    flex: 1,
                    child: ContentControlWidget(
                        border: const Border(
                          top: BorderSide(color: Colors.grey),
                          right: BorderSide(color: Colors.grey),
                        ),
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                        ),
                        onTap: () {},
                        title: "ก่อนหน้า"),
                  ),
                  Flexible(
                    flex: 1,
                    child: ContentControlWidget(
                        border: const Border(
                          top: BorderSide(color: Colors.grey),
                        ),
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                        ),
                        onTap: () {},
                        title: "ถัดไป"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
