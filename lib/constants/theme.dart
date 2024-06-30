import 'dart:ui';

enum AppTheme {
  green,
  amber,
  purple,
}

const List<
    ({
      AppTheme name,
      Color color,
    })> themes = [
  (
    name: AppTheme.green,
    color: Color(0xFFBDDF19),
  ),
  (
    name: AppTheme.amber,
    color: Color(0xFFFFC107),
  ),
  (
    name: AppTheme.purple,
    color: Color(0xFF9C27B0),
  ),
];
