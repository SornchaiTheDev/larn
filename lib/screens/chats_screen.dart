import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ChatsScreen extends StatelessWidget {
  const ChatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text("คุยกับหลาน", style: TextStyle(fontSize: 24)),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, "/add-larn");
                    },
                    child: const Row(
                      children: [
                        FaIcon(FontAwesomeIcons.userPlus),
                        SizedBox(width: 8),
                        Text("เพิ่มหลาน", style: TextStyle(fontSize: 16)),
                      ],
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: Container(
                    width: 60,
                    padding: const EdgeInsets.fromLTRB(8, 4, 8, 4),
                    child: const Center(
                      child: FaIcon(
                        FontAwesomeIcons.magnifyingGlass,
                      ),
                    ),
                  ),
                  hintText: 'ค้นหา',
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30.0)),
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30.0)),
                    borderSide: BorderSide(
                      color: Colors.blue,
                      width: 2.0,
                    ),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30.0)),
                    borderSide: BorderSide(
                      color: Colors.green,
                      width: 2.0,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            const Divider(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage("assets/images/larn1.png"),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "หลานบันเทิง",
                          style: TextStyle(fontSize: 20),
                        ),
                        const Text(
                          "หลานบันเทิงจะช่วยให้คุณ ใช้งานแอปพลิเคชันความบันเทิงได้ง่ายขึ้น",
                          style: TextStyle(fontSize: 16),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            "https://static-00.iconduck.com/assets.00/netflix-icon-icon-2048x2048-yj41gpvr.png",
                            "https://cdn.pixabay.com/photo/2021/06/15/12/28/tiktok-6338429_960_720.png",
                            "https://t3.ftcdn.net/jpg/04/74/05/94/360_F_474059464_qldYuzxaUWEwNTtYBJ44VN89ARuFktHW.jpg",
                          ].map((String src) {
                            return Row(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(
                                      color: Colors.black12,
                                      width: 2,
                                      strokeAlign:
                                          BorderSide.strokeAlignOutside,
                                    ),
                                  ),
                                  clipBehavior: Clip.antiAlias,
                                  child: Image.network(
                                    src,
                                    width: 40,
                                    height: 40,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                const SizedBox(width: 8),
                              ],
                            );
                          }).toList(),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const Divider(),
          ],
        ),
      ),
    );
  }
}
