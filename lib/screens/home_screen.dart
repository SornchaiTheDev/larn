import 'package:flutter/material.dart';
import 'package:larn/widgets/app_content_widget.dart';
import 'package:larn/widgets/header_widget.dart';
import 'package:larn/widgets/larn_content_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentContent = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        bottom: 150,
      ),
      child: Column(
        children: [
          const SafeArea(
            bottom: false,
            child: Padding(
              padding: EdgeInsets.fromLTRB(20, 20, 10, 0),
              child: HeaderWidget(),
            ),
          ),
          Flexible(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: currentContent % 2 == 0
                  ? AppContentWidget(
                      onNext: () => setState(() => currentContent--),
                      onPrev: () => setState(() => currentContent++),
                    )
                  : LarnContentWidget(
                      onNext: () => setState(() => currentContent--),
                      onPrev: () => setState(() => currentContent++),
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
