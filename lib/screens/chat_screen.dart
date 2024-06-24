import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:larn/widgets/back_button_widget.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(bottom: 12.0),
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    width: 1,
                    color: Colors.black26,
                  ),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Row(
                    children: [
                      BackButtonWidget(),
                      Text(
                        "หลานโช",
                        style: TextStyle(
                          fontSize: 24,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {},
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
                          child: const Row(
                            children: [
                              FaIcon(FontAwesomeIcons.ellipsisVertical),
                              SizedBox(
                                width: 12,
                              ),
                              Text('เพิ่มเติม')
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
                child: ListView(
                  children: const [
                    SizedBox(height: 16),
                    ChatBubbleWidget(
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
                    ),
                    SizedBox(height: 24),
                    ChatBubbleWidget(
                      side: BubbleSide.right,
                      text:
                          "Is it possible to send sensor data from apple watch to apple watch app",
                    ),
                    SizedBox(height: 24),
                    MediaBubbleWidget(
                        side: BubbleSide.left,
                        src:
                            "https://m.media-amazon.com/images/M/MV5BOGUyZDUxZjEtMmIzMC00MzlmLTg4MGItZWJmMzBhZjE0Mjc1XkEyXkFqcGdeQXVyMTMxODk2OTU@._V1_.jpg")
                  ],
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
              child: Padding(
                padding: const EdgeInsets.fromLTRB(12.0, 4, 12.0, 10),
                child: Row(
                  children: [
                    const Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Enter text',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(30.0),
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(30.0),
                            ),
                            borderSide: BorderSide(color: Colors.blue),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(30.0),
                            ),
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const FaIcon(FontAwesomeIcons.microphone),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

enum BubbleSide { left, right }

enum BubbleType { chat, media }

class MediaBubbleWidget extends StatelessWidget {
  const MediaBubbleWidget({
    super.key,
    required this.side,
    required this.src,
  });

  final BubbleSide side;
  final String src;

  @override
  Widget build(BuildContext context) {
    bool isLeftSide = side == BubbleSide.left;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Visibility(
          visible: side == BubbleSide.left,
          child: const CircleAvatar(
            radius: 20,
            backgroundImage: AssetImage("assets/images/larn1.png"),
          ),
        ),
        const SizedBox(
          width: 16,
        ),
        Visibility(
          visible: !isLeftSide,
          child: const Expanded(
            child: SizedBox(
              width: 1,
            ),
          ),
        ),
        Flexible(
          flex: 5,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Positioned(
                left: isLeftSide ? -3 : null,
                top: 6,
                right: isLeftSide ? null : 8,
                child: Transform.rotate(
                  angle: 40,
                  child: Container(
                    width: 24,
                    height: 32,
                    decoration: const BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.all(
                        Radius.circular(4.0),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  right: isLeftSide ? 32 : 12,
                ),
                padding: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(
                    width: 1,
                    color: Colors.black,
                  ),
                ),
                child: Image.network(src),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class ChatBubbleWidget extends StatelessWidget {
  const ChatBubbleWidget({
    super.key,
    required this.side,
    required this.text,
  });

  final BubbleSide side;
  final String text;

  @override
  Widget build(BuildContext context) {
    bool isLeftSide = side == BubbleSide.left;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Visibility(
          visible: side == BubbleSide.left,
          child: const CircleAvatar(
            radius: 20,
            backgroundImage: AssetImage("assets/images/larn1.png"),
          ),
        ),
        const SizedBox(
          width: 16,
        ),
        Visibility(
          visible: !isLeftSide,
          child: const Expanded(
            child: SizedBox(
              width: 1,
            ),
          ),
        ),
        Flexible(
          flex: 5,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Positioned(
                left: isLeftSide ? -3 : null,
                top: 6,
                right: isLeftSide ? null : 8,
                child: Transform.rotate(
                  angle: 40,
                  child: Container(
                    width: 24,
                    height: 32,
                    decoration: const BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.all(
                        Radius.circular(4.0),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  right: isLeftSide ? 32 : 12,
                ),
                padding: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(
                    width: 1,
                    color: Colors.black,
                  ),
                ),
                child: Text(
                  text,
                  style: const TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
