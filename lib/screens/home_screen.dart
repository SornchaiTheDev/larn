import 'package:flutter/material.dart';
import 'package:larn/widgets/app_content_widget.dart';
import 'package:larn/widgets/header_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          SafeArea(
            bottom: false,
            child: Padding(
              padding: EdgeInsets.fromLTRB(20, 20, 10, 0),
              child: HeaderWidget(),
            ),
          ),
          Flexible(
            flex: 1,
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: AppContentWidget(),
            ),
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}
