import "package:flutter/material.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(4281887036),
      surfaceTint: Color(4281887036),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4290375864),
      onPrimaryContainer: Color(4278198535),
      secondary: Color(4278216821),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4288606206),
      onSecondaryContainer: Color(4278198052),
      tertiary: Color(4281951596),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4290571250),
      onTertiaryContainer: Color(4278198052),
      error: Color(4287646275),
      onError: Color(4294967295),
      errorContainer: Color(4294957782),
      onErrorContainer: Color(4282059015),
      surface: Color(4294441970),
      onSurface: Color(4279770392),
      onSurfaceVariant: Color(4282534208),
      outline: Color(4285692271),
      outlineVariant: Color(4290955709),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281152044),
      inversePrimary: Color(4288533661),
      primaryFixed: Color(4290375864),
      onPrimaryFixed: Color(4278198535),
      primaryFixedDim: Color(4288533661),
      onPrimaryFixedVariant: Color(4280242215),
      secondaryFixed: Color(4288606206),
      onSecondaryFixed: Color(4278198052),
      secondaryFixedDim: Color(4286764001),
      onSecondaryFixedVariant: Color(4278210392),
      tertiaryFixed: Color(4290571250),
      onTertiaryFixed: Color(4278198052),
      tertiaryFixedDim: Color(4288794326),
      onTertiaryFixedVariant: Color(4280241492),
      surfaceDim: Color(4292336595),
      surfaceBright: Color(4294441970),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4294047212),
      surfaceContainer: Color(4293652454),
      surfaceContainerHigh: Color(4293257697),
      surfaceContainerHighest: Color(4292928731),
    );
  }

  ThemeData light() {
    return theme(lightScheme());
  }

  static ColorScheme lightMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(4279979043),
      surfaceTint: Color(4281887036),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4283334737),
      onPrimaryContainer: Color(4294967295),
      secondary: Color(4278209107),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4280647564),
      onSecondaryContainer: Color(4294967295),
      tertiary: Color(4279912783),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4283464578),
      onTertiaryContainer: Color(4294967295),
      error: Color(4285411370),
      onError: Color(4294967295),
      errorContainer: Color(4289355864),
      onErrorContainer: Color(4294967295),
      surface: Color(4294441970),
      onSurface: Color(4279770392),
      onSurfaceVariant: Color(4282271036),
      outline: Color(4284113240),
      outlineVariant: Color(4285955443),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281152044),
      inversePrimary: Color(4288533661),
      primaryFixed: Color(4283334737),
      onPrimaryFixed: Color(4294967295),
      primaryFixedDim: Color(4281689658),
      onPrimaryFixedVariant: Color(4294967295),
      secondaryFixed: Color(4280647564),
      onSecondaryFixed: Color(4294967295),
      secondaryFixedDim: Color(4278216306),
      onSecondaryFixedVariant: Color(4294967295),
      tertiaryFixed: Color(4283464578),
      onTertiaryFixed: Color(4294967295),
      tertiaryFixedDim: Color(4281754473),
      onTertiaryFixedVariant: Color(4294967295),
      surfaceDim: Color(4292336595),
      surfaceBright: Color(4294441970),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4294047212),
      surfaceContainer: Color(4293652454),
      surfaceContainerHigh: Color(4293257697),
      surfaceContainerHighest: Color(4292928731),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme());
  }

  static ColorScheme lightHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(4278200586),
      surfaceTint: Color(4281887036),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4279979043),
      onPrimaryContainer: Color(4294967295),
      secondary: Color(4278200108),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4278209107),
      onSecondaryContainer: Color(4294967295),
      tertiary: Color(4278200107),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4279912783),
      onTertiaryContainer: Color(4294967295),
      error: Color(4282650636),
      onError: Color(4294967295),
      errorContainer: Color(4285411370),
      onErrorContainer: Color(4294967295),
      surface: Color(4294441970),
      onSurface: Color(4278190080),
      onSurfaceVariant: Color(4280231454),
      outline: Color(4282271036),
      outlineVariant: Color(4282271036),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281152044),
      inversePrimary: Color(4290968257),
      primaryFixed: Color(4279979043),
      onPrimaryFixed: Color(4294967295),
      primaryFixedDim: Color(4278203663),
      onPrimaryFixedVariant: Color(4294967295),
      secondaryFixed: Color(4278209107),
      onSecondaryFixed: Color(4294967295),
      secondaryFixedDim: Color(4278202937),
      onSecondaryFixedVariant: Color(4294967295),
      tertiaryFixed: Color(4279912783),
      onTertiaryFixed: Color(4294967295),
      tertiaryFixedDim: Color(4278202936),
      onTertiaryFixedVariant: Color(4294967295),
      surfaceDim: Color(4292336595),
      surfaceBright: Color(4294441970),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4294047212),
      surfaceContainer: Color(4293652454),
      surfaceContainerHigh: Color(4293257697),
      surfaceContainerHighest: Color(4292928731),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme());
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(4288533661),
      surfaceTint: Color(4288533661),
      onPrimary: Color(4278401298),
      primaryContainer: Color(4280242215),
      onPrimaryContainer: Color(4290375864),
      secondary: Color(4286764001),
      onSecondary: Color(4278203965),
      secondaryContainer: Color(4278210392),
      onSecondaryContainer: Color(4288606206),
      tertiary: Color(4288794326),
      onTertiary: Color(4278203964),
      tertiaryContainer: Color(4280241492),
      onTertiaryContainer: Color(4290571250),
      error: Color(4294948011),
      onError: Color(4283833881),
      errorContainer: Color(4285739821),
      onErrorContainer: Color(4294957782),
      surface: Color(4279244048),
      onSurface: Color(4292928731),
      onSurfaceVariant: Color(4290955709),
      outline: Color(4287402889),
      outlineVariant: Color(4282534208),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4292928731),
      inversePrimary: Color(4281887036),
      primaryFixed: Color(4290375864),
      onPrimaryFixed: Color(4278198535),
      primaryFixedDim: Color(4288533661),
      onPrimaryFixedVariant: Color(4280242215),
      secondaryFixed: Color(4288606206),
      onSecondaryFixed: Color(4278198052),
      secondaryFixedDim: Color(4286764001),
      onSecondaryFixedVariant: Color(4278210392),
      tertiaryFixed: Color(4290571250),
      onTertiaryFixed: Color(4278198052),
      tertiaryFixedDim: Color(4288794326),
      onTertiaryFixedVariant: Color(4280241492),
      surfaceDim: Color(4279244048),
      surfaceBright: Color(4281743925),
      surfaceContainerLowest: Color(4278914827),
      surfaceContainerLow: Color(4279770392),
      surfaceContainer: Color(4280033564),
      surfaceContainerHigh: Color(4280757030),
      surfaceContainerHighest: Color(4281415216),
    );
  }

  ThemeData dark() {
    return theme(darkScheme());
  }

  static ColorScheme darkMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(4288862369),
      surfaceTint: Color(4288533661),
      onPrimary: Color(4278196997),
      primaryContainer: Color(4285111659),
      onPrimaryContainer: Color(4278190080),
      secondary: Color(4287027173),
      onSecondary: Color(4278196766),
      secondaryContainer: Color(4283014314),
      onSecondaryContainer: Color(4278190080),
      tertiary: Color(4289057754),
      onTertiary: Color(4278196765),
      tertiaryContainer: Color(4285307039),
      onTertiaryContainer: Color(4278190080),
      error: Color(4294949553),
      onError: Color(4281533444),
      errorContainer: Color(4291591026),
      onErrorContainer: Color(4278190080),
      surface: Color(4279244048),
      onSurface: Color(4294507763),
      onSurfaceVariant: Color(4291218882),
      outline: Color(4288587162),
      outlineVariant: Color(4286481787),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4292928731),
      inversePrimary: Color(4280308264),
      primaryFixed: Color(4290375864),
      onPrimaryFixed: Color(4278195715),
      primaryFixedDim: Color(4288533661),
      onPrimaryFixedVariant: Color(4278927128),
      secondaryFixed: Color(4288606206),
      onSecondaryFixed: Color(4278195223),
      secondaryFixedDim: Color(4286764001),
      onSecondaryFixedVariant: Color(4278205508),
      tertiaryFixed: Color(4290571250),
      onTertiaryFixed: Color(4278195223),
      tertiaryFixedDim: Color(4288794326),
      onTertiaryFixedVariant: Color(4278729794),
      surfaceDim: Color(4279244048),
      surfaceBright: Color(4281743925),
      surfaceContainerLowest: Color(4278914827),
      surfaceContainerLow: Color(4279770392),
      surfaceContainer: Color(4280033564),
      surfaceContainerHigh: Color(4280757030),
      surfaceContainerHighest: Color(4281415216),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme());
  }

  static ColorScheme darkHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(4293984235),
      surfaceTint: Color(4288533661),
      onPrimary: Color(4278190080),
      primaryContainer: Color(4288862369),
      onPrimaryContainer: Color(4278190080),
      secondary: Color(4294114815),
      onSecondary: Color(4278190080),
      secondaryContainer: Color(4287027173),
      onSecondaryContainer: Color(4278190080),
      tertiary: Color(4294049279),
      onTertiary: Color(4278190080),
      tertiaryContainer: Color(4289057754),
      onTertiaryContainer: Color(4278190080),
      error: Color(4294965753),
      onError: Color(4278190080),
      errorContainer: Color(4294949553),
      onErrorContainer: Color(4278190080),
      surface: Color(4279244048),
      onSurface: Color(4294967295),
      onSurfaceVariant: Color(4294376945),
      outline: Color(4291218882),
      outlineVariant: Color(4291218882),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4292928731),
      inversePrimary: Color(4278202894),
      primaryFixed: Color(4290639292),
      onPrimaryFixed: Color(4278190080),
      primaryFixedDim: Color(4288862369),
      onPrimaryFixedVariant: Color(4278196997),
      secondaryFixed: Color(4289524479),
      onSecondaryFixed: Color(4278190080),
      secondaryFixedDim: Color(4287027173),
      onSecondaryFixedVariant: Color(4278196766),
      tertiaryFixed: Color(4290899959),
      onTertiaryFixed: Color(4278190080),
      tertiaryFixedDim: Color(4289057754),
      onTertiaryFixedVariant: Color(4278196765),
      surfaceDim: Color(4279244048),
      surfaceBright: Color(4281743925),
      surfaceContainerLowest: Color(4278914827),
      surfaceContainerLow: Color(4279770392),
      surfaceContainer: Color(4280033564),
      surfaceContainerHigh: Color(4280757030),
      surfaceContainerHighest: Color(4281415216),
    );
  }

  ThemeData darkHighContrast() {
    return theme(darkHighContrastScheme());
  }


  ThemeData theme(ColorScheme colorScheme) => ThemeData(
     useMaterial3: true,
     brightness: colorScheme.brightness,
     colorScheme: colorScheme,
     textTheme: textTheme.apply(
       bodyColor: colorScheme.onSurface,
       displayColor: colorScheme.onSurface,
     ),
     scaffoldBackgroundColor: colorScheme.background,
     canvasColor: colorScheme.surface,
  );


  List<ExtendedColor> get extendedColors => [
  ];
}

class ExtendedColor {
  final Color seed, value;
  final ColorFamily light;
  final ColorFamily lightHighContrast;
  final ColorFamily lightMediumContrast;
  final ColorFamily dark;
  final ColorFamily darkHighContrast;
  final ColorFamily darkMediumContrast;

  const ExtendedColor({
    required this.seed,
    required this.value,
    required this.light,
    required this.lightHighContrast,
    required this.lightMediumContrast,
    required this.dark,
    required this.darkHighContrast,
    required this.darkMediumContrast,
  });
}

class ColorFamily {
  const ColorFamily({
    required this.color,
    required this.onColor,
    required this.colorContainer,
    required this.onColorContainer,
  });

  final Color color;
  final Color onColor;
  final Color colorContainer;
  final Color onColorContainer;
}
