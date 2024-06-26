import 'package:flutter/material.dart';
import 'package:larn/constants/font_size.dart';
import 'package:larn/constants/theme.dart';

typedef AppTheme = Map<String, Color>;

class SettingStore with ChangeNotifier {
  FontSize _fontSize = FontSize.medium;
  AppTheme _theme = greenTheme;

  FontSize get activeFontSize => _fontSize;

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

  AppTheme get theme => _theme;

  void setFontSize(FontSize fontSize) {
    _fontSize = fontSize;
    notifyListeners();
  }

  void setTheme(AppTheme theme) {
    _theme = theme;
    notifyListeners();
  }
}
