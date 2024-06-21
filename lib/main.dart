import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:larn/screens/add_larn_screen.dart';
import 'package:larn/screens/bottom_navigation_screen.dart';
import 'package:larn/screens/chat_screen.dart';

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
      ),
      routes: {
        '/': (context) => const BottomNavigationScreen(),
        '/chats': (context) => const ChatScreen(),
        "/add-larn": (context) => const AddLarnScreen(),
      },
      initialRoute: "/",
    );
  }
}
