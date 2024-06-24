import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:larn/screens/add_larn_screen.dart';
import 'package:larn/screens/bottom_navigation_screen.dart';
import 'package:larn/screens/call_screen.dart';
import 'package:larn/screens/chat_other_screen.dart';
import 'package:larn/screens/chat_screen.dart';
import 'package:larn/screens/chats_screen.dart';
import 'package:larn/screens/settings_screen.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: GoogleFonts.prompt().fontFamily,
        scaffoldBackgroundColor: Colors.white,
      ),
      routes: {
        '/': (context) => const BottomNavigationScreen(),
        '/chats': (context) => const ChatsScreen(),
        '/chat': (context) => const ChatScreen(),
        "/add-larn": (context) => const AddLarnScreen(),
        "/settings": (context) => const SettingsScreen(),
        "/call": (context) => const CallScreen(),
        "/chat-other": (context) => const ChatOtherScreen(),
      },
      initialRoute: "/chat",
    );
  }
}
