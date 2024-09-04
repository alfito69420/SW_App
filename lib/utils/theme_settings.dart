import 'package:flutter/material.dart';

class ThemeSettings {
  static ThemeData lightTheme(BuildContext context) {
    final theme = ThemeData.light();
    return theme.copyWith(
      colorScheme: Theme.of(context).colorScheme.copyWith(
        primary: Colors.greenAccent,
        
      )
    );

  }

  static ThemeData darkTheme(BuildContext context) {
    final theme = ThemeData.dark();
    return theme.copyWith(
      scaffoldBackgroundColor: Colors.grey,
      primaryColorDark: Colors.black,
    );
  }

  static ThemeData warmThemelight(BuildContext context) {
    final theme = ThemeData.dark();
    return theme.copyWith(
      colorScheme: Theme.of(context).colorScheme.copyWith(
        primary: Colors.grey,
      )
    );
  }
}
