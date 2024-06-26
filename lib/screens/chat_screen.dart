import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:larn/constants/bubble.dart';
import 'package:larn/store/settings_store.dart';
import 'package:larn/widgets/back_button_widget.dart';
import 'package:larn/widgets/chat_bubble_widget.dart';
import 'package:larn/widgets/chat_message_widget.dart';
import 'package:larn/widgets/media_bubble_widget.dart';
import 'package:provider/provider.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double subHeadingFontSize =
        Provider.of<SettingStore>(context).subHeadingFontSize;

    double bodyFontSize = Provider.of<SettingStore>(context).bodyFontSize;

    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(12.0, 58.0, 12.0, 6.0),
            decoration: const BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 10,
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    const BackButtonWidget(),
                    Text(
                      "หลานโช",
                      style: TextStyle(
                        fontSize: subHeadingFontSize,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () => Navigator.pushNamed(context, "/call"),
                      icon: const FaIcon(
                        FontAwesomeIcons.phone,
                      ),
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, "/chat-other");
                      },
                      child: Ink(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          children: [
                            const FaIcon(FontAwesomeIcons.ellipsisVertical),
                            const SizedBox(
                              width: 12,
                            ),
                            Text('เพิ่มเติม',
                                style: TextStyle(fontSize: bodyFontSize))
                          ],
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(12.0, 0, 12.0, 0),
              child: ListView.builder(
                padding: const EdgeInsets.fromLTRB(0, 40, 0, 10),
                itemCount: 3,
                itemBuilder: (context, index) {
                  List<Widget> finalWidgets = [const SizedBox(height: 20)];
                  Widget widget;

                  switch (index) {
                    case 0:
                      widget = const ChatBubbleWidget(
                        side: BubbleSide.right,
                        text:
                            "Is it possible to send sensor data from apple watch to apple watch app",
                      );
                    case 1:
                      widget = const ChatBubbleWidget(
                        side: BubbleSide.left,
                        text:
                            """Yes, it is possible to send sensor data from an Apple Watch to an Apple Watch app. Here’s a general outline of how you can achieve this:
                  1.	Accessing Sensor Data:
                  •	HealthKit: Use HealthKit to access health-related data such as heart rate, steps, and other metrics collected by the Apple Watch. This involves using HKHealthStore to request permissions and query health data.
                  •	Core Motion: Use Core Motion to access motion-related data such as accelerometer and gyroscope data. This involves using CMMotionManager to start and stop sensor updates.
                  2.	Developing the Apple Watch App:
                  •	Create a WatchKit app and WatchKit extension. This involves setting up the user interface in the WatchKit app and handling the business logic in the WatchKit extension.
                  •	Use WatchKit APIs to interact with the watch hardware and retrieve sensor data.
                  3.	Transmitting Data:
                  •	Watch Connectivity Framework: Use the Watch Connectivity framework to transfer data between the Apple Watch and its paired iPhone. This framework allows for the transfer of files, user info, and application context in the background.
                  •	Direct Communication: If you need real-time data transfer, you can use the WCSession class to send messages directly between the Apple Watch and the iPhone.""",
                      );
                    case 2:
                      widget = const MediaBubbleWidget(
                          side: BubbleSide.left,
                          src:
                              "https://m.media-amazon.com/images/M/MV5BOGUyZDUxZjEtMmIzMC00MzlmLTg4MGItZWJmMzBhZjE0Mjc1XkEyXkFqcGdeQXVyMTMxODk2OTU@._V1_.jpg");
                    default:
                      widget = const SizedBox();
                  }

                  finalWidgets.insert(0, widget);

                  return Column(
                    children: finalWidgets,
                  );
                },
              ),
            ),
          ),
          Container(
            height: 100,
            decoration: const BoxDecoration(
              color: Colors.white,
              border: Border(
                top: BorderSide(
                  width: 1,
                  color: Colors.black26,
                ),
              ),
            ),
            child: const Padding(
              padding: EdgeInsets.fromLTRB(12.0, 4, 12.0, 10),
              child: ChatMessageWidget(),
            ),
          ),
        ],
      ),
    );
  }
}
