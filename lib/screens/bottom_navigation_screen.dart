import 'package:flutter/material.dart';
import 'package:larn/screens/call_larn_screen.dart';
import 'package:larn/screens/chats_screen.dart';
import 'package:larn/screens/home_screen.dart';
import 'package:larn/widgets/bottom_navigation_widget.dart';
import 'package:larn/widgets/call_larn_button_widget.dart';

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
      body: SizedBox(
        width: double.infinity,
        child: Stack(
          children: [
            Positioned(
              left: 0,
              right: 0,
              top: 0,
              bottom: 0,
              child: Column(
                children: [
                  Expanded(
                    child: screens[currentIndex],
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: BottomNavigationWidget(
                currentIndex: currentIndex,
                onTap: onTap,
              ),
            ),
            CallLarnButtonWidget(onTap: onTap),
          ],
        ),
      ),
    );
  }
}
