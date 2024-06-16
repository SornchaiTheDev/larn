import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          "สวัสดีค่ะ ยายแอ๋ว",
          style: TextStyle(fontSize: 20),
        ),
        InkWell(
          onTap: () {
            print("HELLO WORLD");
          },
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              children: [
                FaIcon(FontAwesomeIcons.gear),
                SizedBox(width: 8),
                Text("ตั้งค่า", style: TextStyle(fontSize: 20)),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
