import 'package:flutter/material.dart';
import 'package:larn/screens/call_larn_screen.dart';
import 'package:larn/screens/chats_screen.dart';
import 'package:larn/screens/home_screen.dart';
import 'package:larn/widgets/bottom_navigation_widget.dart';

class BottomNavigationScreen extends StatefulWidget {
  const BottomNavigationScreen({super.key});

  @override
  State<BottomNavigationScreen> createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {
  final List<Widget> screens = [
    const HomeScreen(),
    const ChatsScreen(),
    const CallLarnScreen(),
  ];

  int currentIndex = 0;

  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: screens[currentIndex],
          ),
          const SizedBox(height: 40),
          BottomNavigationWidget(
            currentIndex: currentIndex,
            onTap: onTap,
          ),
        ],
      ),
    );
  }
}
