import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:larn/store/settings_store.dart';
import 'package:larn/widgets/back_button_widget.dart';
import 'package:larn/widgets/search_widget.dart';
import 'package:provider/provider.dart';

class ChatOtherScreen extends StatefulWidget {
  const ChatOtherScreen({super.key});

  @override
  State<ChatOtherScreen> createState() => _ChatOtherScreenState();
}

class _ChatOtherScreenState extends State<ChatOtherScreen> {
  @override
  Widget build(BuildContext context) {
    double bodyFontSize = Provider.of<SettingStore>(context).bodyFontSize;
    double subHeadingFontSize =
        Provider.of<SettingStore>(context).subHeadingFontSize;

    final TextEditingController controller = TextEditingController();
    controller.addListener(() {
      setState(() {});
    });

    List<String> videos = [];

    String searchValue = controller.text;
    List<String> filterdContents = videos
        .where(
            (video) => video.toLowerCase().contains(searchValue.toLowerCase()))
        .toList();
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Expanded(child: BackButtonWidget()),
                  Column(
                    children: [
                      Text(
                        'วิดิโอสอนใช้',
                        style: TextStyle(fontSize: subHeadingFontSize),
                      ),
                    ],
                  ),
                  const Expanded(child: SizedBox()),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: SearchWidget(
                  controller: controller,
                ),
              ),
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.all(16.0),
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.only(bottom: index == 9 ? 40 : 20),
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 1,
                          color: Colors.black12,
                          strokeAlign: BorderSide.strokeAlignOutside,
                        ),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(12.0),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 400,
                            height: 200,
                            child: Image.network(
                              "https://marketplace.canva.com/EAFW7JwIojo/2/0/1600w/canva-red-colorful-tips-youtube-thumbnail-FxVVsqyawqY.jpg",
                              fit: BoxFit.cover,
                              loadingBuilder: (context, child,
                                      loadingProgress) =>
                                  loadingProgress == null
                                      ? child
                                      : const SizedBox(
                                          width: 400,
                                          height: 300,
                                          child: Center(
                                            child: CircularProgressIndicator(),
                                          ),
                                        ),
                              errorBuilder: (context, error, stackTrace) =>
                                  SizedBox(
                                width: 400,
                                height: 400,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const FaIcon(
                                      FontAwesomeIcons.triangleExclamation,
                                      color: Colors.red,
                                    ),
                                    const SizedBox(height: 20),
                                    Text(
                                      "เกิดข้อผิดพลาดในการโหลดมีเดีย",
                                      style: TextStyle(
                                        fontSize: bodyFontSize,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 12),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(100),
                                    ),
                                  ),
                                  clipBehavior: Clip.antiAlias,
                                  child: Image.network(
                                    "https://static-00.iconduck.com/assets.00/netflix-icon-icon-2048x2048-yj41gpvr.png",
                                    width: 60,
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "พื้นฐานการใช้งานอะไรซักอย่าง",
                                        style: TextStyle(
                                          fontSize: subHeadingFontSize,
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.baseline,
                                        textBaseline: TextBaseline.alphabetic,
                                        children: [
                                          Text(
                                            "โดย",
                                            style: TextStyle(
                                              fontSize: bodyFontSize,
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 4,
                                          ),
                                          Text(
                                            "Netflix",
                                            style: TextStyle(
                                              fontSize: bodyFontSize,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
