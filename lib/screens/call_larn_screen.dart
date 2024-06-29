import 'package:flutter/material.dart';
import 'package:larn/store/settings_store.dart';
import 'package:provider/provider.dart';

class CallLarnScreen extends StatelessWidget {
  const CallLarnScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double headingFontSize = Provider.of<SettingStore>(context).headingFontSize;
    return SafeArea(
      bottom: false,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          margin: const EdgeInsets.only(
            bottom: 180,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "เรียกหลาน",
                style: TextStyle(
                  fontSize: headingFontSize,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 20),
              const Align(
                alignment: Alignment.center,
                child: CircleAvatar(
                  radius: 100,
                  backgroundImage: AssetImage("assets/images/larn1.png"),
                ),
              ),
              const SizedBox(height: 32),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 2,
                      color: Colors.black12,
                    ),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                  ),
                  child: Column(
                    children: [
                      Expanded(
                        child: ListView(),
                      ),
                      // const Padding(
                      //   padding: EdgeInsets.fromLTRB(10, 0, 10, 14),
                      //   child: ChatMessageWidget(textController: ,),
                      // ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
