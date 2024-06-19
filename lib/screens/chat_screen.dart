import 'package:flutter/material.dart';
import 'package:larn/widgets/bottom_navigation_widget.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          SizedBox(height: 40),
          BottomNavigationWidget(),
        ],
      ),
    );
  }
}
