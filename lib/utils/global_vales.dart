import 'package:flutter/material.dart';

class GlobalValues {
  static ValueNotifier flagThemeDark = ValueNotifier(false);
  static ValueNotifier banUpdListMovies = ValueNotifier(false);
  static ValueNotifier<String> selectedFontFamily =
      ValueNotifier<String>("Arimo");

  //  Color Scheme
  static ValueNotifier<ColorScheme> colorScheme =
      ValueNotifier<ColorScheme>(const ColorScheme.light());
  static ValueNotifier<bool> customThemeEnabled = ValueNotifier(false);
}
