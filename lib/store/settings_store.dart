import 'package:flutter/material.dart';
import 'package:larn/constants/font_size.dart';
import 'package:larn/constants/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingStore with ChangeNotifier {
  FontSize _fontSize = FontSize.medium;
  AppTheme _theme = AppTheme.green;

  FontSize get activeFontSize => _fontSize;
  late SharedPreferences prefs;

  SettingStore(int? fontSize, int? theme) {
    initStore();

    if (fontSize == null || theme == null) {
      return;
    }

    _fontSize = FontSize.values[fontSize];
    _theme = AppTheme.values[theme];
  }

  void initStore() async {
    prefs = await SharedPreferences.getInstance();
  }

  double get headingFontSize {
    switch (_fontSize) {
      case FontSize.small:
        return 23.89;
      case FontSize.medium:
        return 30;
      case FontSize.large:
        return 40;
      case FontSize.extraLarge:
        return 42;
    }
  }

  double get subHeadingFontSize {
    switch (_fontSize) {
      case FontSize.small:
        return 18;
      case FontSize.medium:
        return 20;
      case FontSize.large:
        return 22;
      case FontSize.extraLarge:
        return 24;
    }
  }

  double get bodyFontSize {
    switch (_fontSize) {
      case FontSize.small:
        return 14;
      case FontSize.medium:
        return 16;
      case FontSize.large:
        return 18;
      case FontSize.extraLarge:
        return 20;
    }
  }

  Color get primaryColor {
    switch (_theme) {
      case AppTheme.green:
        return const Color(0xFFBDDF19);
      case AppTheme.amber:
        return const Color(0xFFFFC107);
      case AppTheme.purple:
        return const Color(0xFF9C27B0);
    }
  }

  void setFontSize(FontSize fontSize) async {
    _fontSize = fontSize;
    await prefs.setInt('font-size', fontSize.index);
    notifyListeners();
  }

  void setTheme(AppTheme theme) async {
    _theme = theme;
    await prefs.setInt('theme', theme.index);
    notifyListeners();
  }
}
