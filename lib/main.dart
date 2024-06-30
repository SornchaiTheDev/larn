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
import 'package:larn/services/chat_service.dart';
import 'package:larn/services/db_service.dart';
import 'package:larn/store/chat_history_store.dart';
import 'package:larn/store/larn_store.dart';
import 'package:larn/store/settings_store.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:speech_to_text/speech_to_text_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DbService().initDB();

  final prefs = await SharedPreferences.getInstance();

  final int? fontSize = prefs.getInt("font-size");
  final int? theme = prefs.getInt("theme");

  runApp(
    ChangeNotifierProvider(
      create: (context) => SettingStore(fontSize, theme),
      child: ChangeNotifierProvider(
        create: (context) => LarnStore(),
        child: ChangeNotifierProvider(
          create: (context) => ChatHistoryStore(context),
          child: const App(),
        ),
      ),
    ),
  );
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final SpeechToText speech = SpeechToText();
  late SpeechToTextProvider speechProvider;

  @override
  void initState() {
    super.initState();
    speechProvider = SpeechToTextProvider(speech);
    initSpeechState();
  }

  Future<void> initSpeechState() async {
    await speechProvider.initialize();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SpeechToTextProvider>.value(
      value: speechProvider,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: GoogleFonts.prompt().fontFamily,
          scaffoldBackgroundColor: Colors.white,
          primaryColor: Provider.of<SettingStore>(context).primaryColor,
          sliderTheme: SliderThemeData(
            trackHeight: 4,
            thumbColor: Provider.of<SettingStore>(context).primaryColor,
            activeTrackColor: Provider.of<SettingStore>(context).primaryColor,
            thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 8),
            overlayShape: const RoundSliderOverlayShape(overlayRadius: 16),
          ),
          progressIndicatorTheme: ProgressIndicatorThemeData(
            color: Provider.of<SettingStore>(context).primaryColor,
          ),
        ),
        routes: {
          '/': (context) => const BottomNavigationScreen(),
          '/chats': (context) => const ChatsScreen(),
          '/chat': (context) => ChangeNotifierProvider(
                create: (context) => ChatService(context),
                child: const ChatScreen(),
              ),
          "/add-larn": (context) => const AddLarnScreen(),
          "/settings": (context) => const SettingsScreen(),
          "/call": (context) => const CallScreen(),
          "/chat-other": (context) => const ChatOtherScreen(),
          "/call-larn": (context) => const CallLarnScreen(),
        },
        initialRoute: "/",
      ),
    );
  }
}
