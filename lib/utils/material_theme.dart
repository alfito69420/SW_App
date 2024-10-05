import "package:flutter/material.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  ThemeData light() {
    return ThemeData(
      useMaterial3: true,
      colorScheme: const ColorScheme.light(primary: Colors.green),
      textTheme: textTheme.apply(
        bodyColor: Colors.black,
        displayColor: Colors.black,
      ),
      scaffoldBackgroundColor: Colors.white,
      canvasColor: Colors.white,
    );
  }

  ThemeData dark() {
    return ThemeData(
      useMaterial3: true,
      colorScheme: const ColorScheme.dark(primary: Colors.black45),
      textTheme: textTheme.apply(
        bodyColor: Colors.black,
        displayColor: Colors.black,
      ),
      scaffoldBackgroundColor: Colors.grey,
      canvasColor: Colors.grey,
    );
  }

  ThemeData custom(ColorScheme colorScheme) {
    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      textTheme: textTheme.apply(
        bodyColor: colorScheme.onSurface,
        displayColor: colorScheme.onSurface,
      ),
      scaffoldBackgroundColor: colorScheme.background,
      canvasColor: colorScheme.surface,
    );
  }
}