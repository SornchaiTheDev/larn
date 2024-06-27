import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:larn/screens/add_larn_screen.dart';
import 'package:larn/screens/bottom_navigation_screen.dart';
import 'package:larn/screens/call_larn_screen.dart';
import 'package:larn/screens/call_screen.dart';
import 'package:larn/screens/chat_other_screen.dart';
import 'package:larn/screens/chat_screen.dart';
import 'package:larn/screens/chats_screen.dart';
import 'package:larn/screens/settings_screen.dart';
import 'package:larn/store/larn_store.dart';
import 'package:larn/store/settings_store.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => SettingStore(),
      child: ChangeNotifierProvider(
        create: (context) => LarnStore(),
        child: const App(),
      ),
    ),
  );
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
        primaryColor: Provider.of<SettingStore>(context).theme['primary'],
        sliderTheme: SliderThemeData(
          trackHeight: 4,
          thumbColor: Provider.of<SettingStore>(context).theme['primary'],
          activeTrackColor: Provider.of<SettingStore>(context).theme['primary'],
          thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 8),
          overlayShape: const RoundSliderOverlayShape(overlayRadius: 16),
        ),
        progressIndicatorTheme: ProgressIndicatorThemeData(
          color: Provider.of<SettingStore>(context).theme['primary'],
        ),
      ),
      routes: {
        '/': (context) => const BottomNavigationScreen(),
        '/chats': (context) => const ChatsScreen(),
        '/chat': (context) => const ChatScreen(),
        "/add-larn": (context) => const AddLarnScreen(),
        "/settings": (context) => const SettingsScreen(),
        "/call": (context) => const CallScreen(),
        "/chat-other": (context) => const ChatOtherScreen(),
        "/call-larn": (context) => const CallLarnScreen(),
      },
      initialRoute: "/",
    );
  }
}
